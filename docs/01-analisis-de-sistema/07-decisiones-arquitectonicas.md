# 07. Decisiones arquitectónicas

Estado común: **propuestas de diseño del Sprint 01**, sujetas a validación durante la implementación. Fecha: 15/10/2026. No representan acuerdos de terceros ni decisiones ya implementadas.

## ADR-01. Cliente-servidor con backend administrado y módulos

**Contexto:** MotoYa necesita autenticación, seguimiento y persistencia con un equipo inicial pequeño. **Decisión:** Flutter móvil y Flutter Web consumen Firebase Auth, lecturas autorizadas de Firestore, Storage privado y comandos de Cloud Functions. El backend organiza Identidad, Conductores, Despacho, Viajes, Billetera y Seguridad como módulos. **Alternativas:** servidor propio con PostgreSQL/PostGIS; microservicios independientes. **Consecuencia:** reduce administración inicial, pero exige controlar costo por operación, dependencia del proveedor y límites de concurrencia. **Validación:** carga de 300 viajes y medición de costo por viaje antes del piloto.

## ADR-02. Clean Architecture y puertos

**Contexto:** simulaciones y servicios reales deben poder intercambiarse. **Decisión:** dominio independiente; aplicación coordina; infraestructura implementa puertos; presentación traduce comandos. TypeScript es una elección para el backend propuesto. **Alternativa:** reglas dentro de widgets y callbacks de Firestore. **Consecuencia:** más interfaces, pero pruebas del negocio sin Firebase. **Validación:** dominio sin imports de Flutter, Firebase o proveedores; contratos de adaptadores equivalentes.

## ADR-03. Asignación y finalización atómicas

**Contexto:** doble aceptación, reintentos y eventos repetidos pueden duplicar viajes o comisiones. **Decisión:** aceptar oferta bloquea lógicamente pasajero/conductor, reserva comisión y crea viaje en una transacción. Finalizar crea movimiento único `comision:{viajeId}`, consume reserva, libera participantes y cambia estado en otra transacción. Cancelar libera reserva sin débito. **Alternativa:** cobro aislado mediante evento después del cambio de estado. **Consecuencia:** consistencia fuerte del núcleo, con notificaciones fuera de la transacción. Un outbox persistido junto al cambio permite reintentar avisos. **Validación:** PV-02 a PV-04.

Las [transacciones de Firestore](https://firebase.google.com/docs/firestore/manage-data/transactions) permiten aplicar conjuntamente las escrituras; su función puede reejecutarse ante concurrencia. Por ello no se envían mensajes ni se consulta un proveedor externo dentro del callback transaccional.

## ADR-04. Cotización calculada y conservada en servidor

**Contexto:** el cliente no debe modificar distancia ni parámetros de cobro. **Decisión:** una cotización conserva ruta, distancia, proveedor, versión de tarifa y vencimiento. El viaje copia esos datos al asignarse. La comisión usa distancia planeada, no GPS acumulado. **Alternativa:** recalcular al finalizar con la configuración del momento. **Consecuencia:** evita variaciones retroactivas; requiere expiración de cotizaciones y almacenamiento de la versión. **Validación:** una actualización de tarifa no modifica un viaje ya aceptado.

## ADR-05. Accesos mínimos y eventos durables

**Contexto:** documentos personales, saldo y alertas requieren controles distintos. **Decisión:** lecturas por participante/rol, documentos privados y comandos con autorización en servidor. SOS y auditoría persisten antes de notificar. **Alternativa:** confianza en la interfaz o en la recepción de push. **Consecuencia:** mantener reglas y controles de funciones; FCM no demuestra que una persona recibió o atendió la alerta. **Validación:** accesos cruzados denegados y escalamiento sin depender de push.

Los [reintentos de funciones](https://firebase.google.com/docs/functions/retries) exigen operaciones idempotentes: los consumidores usan identificadores de evento y guardan su resultado. La entrega de avisos puede repetirse; el dinero no se procesa desde ese consumidor.

## ADR-06. Resolución de ambigüedades del negocio

| Tema | Inconsistencia detectada | Propuesta para esta versión | Pendiente |
|---|---|---|---|
| Ruta de tarifa | Se menciona ruta más rápida y también más corta | Usar la más rápida válida y guardar su distancia; no elegir por línea recta | Confirmar criterio de producto antes de programar |
| Noche | El ejemplo conserva un precio por km anterior | Aplicar S/ 2.14/km, mínimo S/ 3 y luego S/ 2 nocturnos; 3.25 km: S/ 7 diurnos, S/ 9 nocturnos | Aprobar orden de mínimo y recargo |
| Permiso de tarifas | Algunos RF dicen administrador y la matriz reserva finanzas al dueño | Solo dueño cambia tarifa y comisión; administrador configura operación | Confirmar matriz definitiva |
| Advertencias | Tabla general indica suspensión temporal, regla específica exige apelación | Tercera advertencia activa suspende hasta revisión; caducidad de advertencia no reactiva por sí sola | Definir procedimiento de apelación |
| Espera fraccionada | No se define cobro por fracción de minuto | Proponer minutos completos después de 5 min; 5:59 no cobra, 6:00 cobra S/ 0.50 | Aprobar antes del piloto |
| Ubicación y auditoría | Auditoría de 2 años y recorrido de 12 meses | Metadatos 2 años; recorrido detallado 12 meses; chat 90 días | Validar política de retención y excepciones |
| Caída de ambos motores de rutas | Se plantea estimación en línea recta | Mostrar estimación informativa, sin asignar ni cobrar hasta obtener ruta válida | Confirmar experiencia de reintento |

Estas propuestas evitan decisiones implícitas. Su aprobación funcional sigue pendiente; el diseño ya indica qué comportamiento implementar y qué pruebas deben cambiar si se elige otra regla.
