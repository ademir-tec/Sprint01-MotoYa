# Decisiones arquitectónicas

Las decisiones vinculan las necesidades del proyecto con responsabilidades verificables.

| ADR | Decisión | Justificación | Consecuencia |
|---|---|---|---|
| ADR-01 | Cliente-servidor con Cloud Functions. | Centralizar validaciones y compartir datos entre app y panel. | El servidor autoriza las operaciones críticas. |
| ADR-02 | Arquitectura Limpia. | Aislar reglas de pantallas y proveedores. | Las dependencias de código apuntan al núcleo. |
| ADR-03 | Asignación, cierre y saldo mediante operaciones transaccionales. | Conservar consistencia ante concurrencia y reintentos. | Una asignación y un movimiento por operación válida. |
| ADR-04 | Ruta, distancia y cotización autoritativas en servidor. | Evitar depender de kilómetros manipulados en el APK. | La app utiliza quoteId; el servidor conserva distancia, precio, política y vigencia. |
| ADR-05 | Inyección de adaptadores desde composición. | Separar comportamiento de proveedores y facilitar pruebas. | Los dobles de pruebas cumplen los mismos contratos. |
| ADR-06 | Permisos por rol y segundo factor en panel. | Proteger expedientes, finanzas y administración. | Cada comando verifica identidad y autorización. |
| ADR-07 | Presencia del conductor con vigencia y control de ubicación. | Evitar nuevas asignaciones sin disponibilidad válida. | Offline al perder ubicación; el servidor rechaza presencia inválida o vencida. |
| ADR-08 | Claves separadas por plataforma y servicio. | Limitar exposición y uso indebido. | Secret Manager para backend; restricciones por aplicación/API para SDK móvil. |

---

[Volver al índice](../../README.md)
