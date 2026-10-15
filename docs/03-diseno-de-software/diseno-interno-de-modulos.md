# Diseño interno de módulos

## Módulo de referencia: Viajes

La estructura siguiente es una propuesta para implementar en el repositorio de la aplicación; no corresponde a código ejecutable incluido en este entregable.

```text
functions/src/modules/viajes/
  dominio/
    viaje.ts
    dinero.ts
    politica-comision.ts
    cierre-viaje.port.ts
    reloj.port.ts
  aplicacion/
    finalizar-viaje.ts
    finalizar-viaje.command.ts
  infraestructura/
    firestore-cierre-viaje.adapter.ts
  presentacion/
    finalizar-viaje.handler.ts
  viajes.module.ts
```

| Pieza | Responsabilidad | Dependencia permitida |
|---|---|---|
| Viaje | Estado y transiciones válidas | Objetos de valor del dominio |
| PoliticaComision | Comisión según instantánea de distancia y promoción | Dinero y reglas puras |
| CierreViajePort | Contrato de operación atómica completa | Tipos del dominio |
| FinalizarViaje | Orquestar cierre y comprobar identidad del comando | Puertos y dominio |
| FirestoreCierreViajeAdapter | Leer estado y aplicar cambio, ledger, reserva y outbox juntos | Dominio y SDK de persistencia |
| FinalizarViajeHandler | Validar formato, sesión y traducir respuesta | Aplicación |
| viajes.module | Instanciar e inyectar dependencias | Todas las capas |

## Contrato de finalización

**Entrada:** `viajeId`, `idempotencyKey` y `expectedVersion`. El `actorId` procede de la sesión verificada, no del cuerpo. **Salida:** `viajeId`, estado, comisión en céntimos, total a cobrar al pasajero y versión. No se recibe del cliente una comisión ni un saldo final.

### Algoritmo transaccional propuesto

1. Autorizar al actor como conductor del viaje, incluso si la operación ya fue procesada.
2. Leer resultado idempotente por actor/comando/clave y comparar huella del payload. Si coincide, devolverlo; si la clave se reutilizó con otro payload, rechazar.
3. Leer viaje, participantes, reserva, saldo y movimiento determinista antes de escribir.
4. Si el viaje ya terminó, devolver su cierre persistido; si no, exigir `EnViaje` y versión esperada.
5. Calcular comisión con la instantánea aceptada y comprobar reserva suficiente. Con promoción, registrar comisión cero y monto teórico por separado.
6. Crear el movimiento `comision:{viajeId}`, consumir reserva, actualizar saldo materializado y marcar `Terminado`. Liberar bloqueos de ambos participantes y guardar resultado idempotente.
7. Añadir un evento outbox en la misma transacción. Después del commit, un consumidor entrega notificaciones con deduplicación.

Una falla antes del commit deja todo sin cambios. Si la red cae después, el reintento devuelve el cierre guardado. Una falla del proveedor de notificaciones no revierte el viaje ni vuelve a cobrar.

## Contratos de comandos propuestos

| Comando | Entrada de negocio | Precondición | Resultado |
|---|---|---|---|
| CrearSolicitud | cotizacionId, ofertaCentimos, medioPago | Cotización vigente, cobertura y cuenta habilitada | Solicitud con vencimiento |
| EnviarOferta | solicitudId, versionOferta, precioCentimos | Conductor elegible y precio dentro de reglas | Oferta con caducidad |
| AceptarOferta | ofertaId, expectedVersion | Propiedad, vigencia, disponibilidad y saldo | Viaje asignado y reserva |
| MarcarLlegada | viajeId, muestraUbicacion | Conductor asignado, estado y GPS válido hasta 100 m | Esperando y hora servidor |
| IniciarViaje | viajeId, pin | Esperando, PIN correcto y contador permitido | EnViaje |
| FinalizarViaje | viajeId, expectedVersion | Conductor asignado, EnViaje | Terminado y comisión única |
| ConfirmarRecarga | recargaId, referenciaVerificada | Personal autorizado y revisión de abono | Movimiento y saldo |
| ActivarSOS | viajeId, ubicacionDisponible | Participante del viaje | Alerta persistida y entrega pendiente |

Todos los comandos de mutación incorporan clave de idempotencia y validación de esquema. Las coordenadas incluyen precisión, instante de captura y secuencia; el servidor agrega su hora de recepción. Los límites de antigüedad/precisión se calibrarán en el piloto para evitar sanciones por mala señal.

## Dinero

Los importes se almacenan en céntimos enteros y la distancia planeada en metros enteros. Para S/ 0.333 por km, `comisionCentimos = roundHalfUp(metros * 333 / 10000)`. Ejemplo: 4,500 m produce 150 céntimos. Usar aritmética decimal o racional y redondear una sola vez; no acumular errores de punto flotante.
