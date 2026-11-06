# Trazabilidad y verificación del diseño

Cada decisión del diseño se relaciona con una necesidad y una comprobación. Las mediciones registran sus resultados durante la validación de la implementación.

| Necesidad | Diseño | Comprobación |
|---|---|---|
| Recojo lejos del paradero | HU-15 y DA-08. | Solicitar desde un punto de cobertura y consultar llegada. |
| Precio confiable | ADR-04 y cotización del servidor. | Manipular km, quoteId u oferta y verificar rechazo o uso de valores autoritativos. |
| Contratos independientes | OfferService, casos de uso y adaptadores. | Pruebas de contrato y revisión de imports. |
| Datos privados | Identidad, reglas y autorización. | EQ-04 con matriz de roles. |
| Ubicación requerida | Presencia vigente y bloqueo de aceptación. | EQ-10 en emulador y dispositivo. |
| Concurrencia | Asignación y movimientos transaccionales. | EQ-03 y EQ-05 con reintentos e intentos simultáneos. |
| Continuidad | Alertas persistidas, monitoreo y respaldo. | EQ-06, EQ-08 y EQ-09. |

---

[Volver al índice](../../README.md)
