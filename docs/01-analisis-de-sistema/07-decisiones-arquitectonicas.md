# Decisiones arquitectónicas


| ADR | Decisión | Justificación | Consecuencia y estado |
|---|---|---|---|
| ADR-01 | Cliente-servidor y backend administrado | Integrar identidad, datos y comandos | Implementación local; despliegue separado. |
| ADR-02 | Arquitectura Limpia | Aislar negocio de frameworks | Capas explícitas; control estático aprobado en esta revisión. |
| ADR-03 | Asignación y cierre transaccionales | Preservar consistencia | Backend existente; reservas de saldo y outbox del diseño anterior siguen como mejoras propuestas. |
| ADR-04 | Recalcular y validar precios en el backend real | Reducir confianza en el cliente | Aún recibe km; cálculo independiente de ruta sigue pendiente. |
| ADR-05 | Selección de implementaciones en composición | Facilitar demo y pruebas | Providers eligen servicios reales o simulados. |
| ADR-06 | Acceso al panel mediante roles y segundo factor | Restringir operaciones internas | Implementación local; políticas concretas deben verificarse por comando. |
| ADR-07 nuevo | Desconexión al perder ubicación habilitada | Evitar operar sin localización | Se bloquea aceptación; no demuestra por sí sola detección de GPS falsificado. |

---

[Volver al índice](../../README.md)
