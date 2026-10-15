# 03. Requisitos funcionales

Se conserva la identificación RF-P (pasajero), RF-C (conductor), RF-S (soporte) y RF-A (cuenta). Esta selección agrupa los requisitos relevantes para la arquitectura; no representa una implementación de todo el catálogo del producto.

| Grupo / IDs | Comportamiento requerido | Responsable técnico | Validación |
|---|---|---|---|
| RF-P01, RF-P02; RF-A01 a RF-A05 | Cuenta por celular, sesión, modos, avatar y alias único | Identidad | Verificación SMS, alias normalizado único y cambio de modo permitido |
| RF-P03 a RF-P07 | Mapa, origen, destino, ruta, tarifa y medio de pago | Geolocalización + Tarifas | Cobertura y cotización calculadas por servidor |
| RF-P08 a RF-P11; RF-C06 a RF-C08 | Buscar conductores, ofertar y elegir | Despacho | Caducidad, elegibilidad y asignación única |
| RF-P12; RF-C18; RF-P23 | Cancelar, registrar llegada, espera y no presentado | Viajes | Umbrales de distancia y tiempo; advertencia sin cobro |
| RF-C12, RF-C13, RF-C21; RF-P13, RF-P25 | Navegar, iniciar con PIN, seguir y terminar | Viajes | Transiciones autorizadas y comisión única |
| RF-P14, RF-P15, RF-P19, RF-P26; RF-S05, RF-S27 | Compartir, contactos, SOS y comprobación de seguridad | Seguridad del viaje | Persistencia, escalamiento y estado de entrega |
| RF-P22; RF-C17; RF-S13 | Chat durante el viaje y consulta justificada | Comunicación | Solo participantes; soporte con caso autorizado |
| RF-C01 a RF-C05, RF-C25; RF-S02, RF-S03, RF-S19 | Registro y modificación documental | Conductores | Aprobación, observaciones, vigencias y versiones |
| RF-C09 a RF-C11; RF-S04, RF-S25 | Saldo, recarga y ajuste | Billetera | Libro de movimientos, deduplicación y autorización |
| RF-P17, RF-C14; RF-S08 | Calificación y moderación | Reputación | Participación y unicidad por viaje/autor |
| RF-S01, RF-S07, RF-S11, RF-S14, RF-S21 a RF-S23 | Panel, sanciones, personal, auditoría y apelación | Administración | Roles, segundo factor, motivo y revisor independiente |
| RF-S09, RF-S12, RF-S29, RF-S30, RF-S40 | Tarifas, campaña, zonas, textos y versión mínima | Configuración | Versionado, permiso y fecha de vigencia |
| RF-P32, RF-A09 | Solicitud de eliminación y copia de datos | Identidad | Autenticación reciente y flujo trazable |
| RF-S31, RF-S32, RF-S34 | Finanzas, gastos y exportaciones | Reportes | Separar recargas, comisiones e ingresos del conductor |

## Casos de uso críticos

### CU-02: solicitar y negociar

**Actor:** pasajero autenticado. **Precondición:** cuenta habilitada, sin otra solicitud activa, puntos dentro de cobertura. El servidor obtiene una ruta válida y cotiza; el pasajero propone un precio dentro del rango y confirma el medio de pago. Despacho filtra conductores elegibles, recibe ofertas y el pasajero selecciona una. Una transacción comprueba disponibilidad de ambas partes, vigencia de solicitud y oferta, reserva la comisión y crea el viaje. Si la oferta venció o el conductor ya fue asignado, no se modifica el estado y se informa conflicto. A los 3 minutos sin acuerdo, la solicitud vence.

### CU-04: realizar viaje

**Actores:** conductor asignado y pasajero. El conductor se dirige al recojo, marca llegada dentro de 100 m, valida PIN y comienza. El servidor registra tiempos y el recargo de espera según la política vigente. Al terminar, confirma estado y comisión en una sola transacción. Si se reintenta, devuelve el resultado original. El pago al conductor ocurre fuera de MotoYa y no se certifica por el sistema.

### CU-12: confirmar recarga

**Actor:** soporte autorizado. Con recarga pendiente, el agente contrasta el abono, registra evidencia de revisión y confirma. El servidor comprueba monto, identidad única del comprobante y estado pendiente, crea el movimiento y actualiza el saldo. Si otro agente ya la resolvió, devuelve el resultado existente o conflicto; nunca duplica saldo.

## Exclusiones explícitas

RF-P27 (preferencia de conductora) está retirado. RF-P31 (programación de viajes), llamadas enmascaradas y enlace público de seguimiento se difieren. El MVP comparte los datos por WhatsApp; no incorpora una pasarela de pago. La activación del libro de reclamaciones requiere revisión operativa y normativa previa al lanzamiento y no se considera cumplimiento demostrado.
