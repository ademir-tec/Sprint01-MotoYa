# Límites de confianza y controles

El diseño asume que un cliente puede enviar información manipulada. Las decisiones autoritativas se toman en el backend.

| Entrada o recurso | Control del sistema | Verificación |
|---|---|---|
| Origen y destino | Validación de formato, cobertura y coherencia. Consulta de ruta en servidor. | Rechazar puntos inválidos y rutas fuera de cobertura. |
| Kilómetros y tarifa | El servidor conserva y usa los valores de su cotización. | Alterar km o precio en el cliente no cambia la base autoritativa. |
| quoteId | Propiedad, vigencia, recorrido y uso válido de la cotización. | Rechazar cotizaciones ajenas, vencidas o reutilizadas indebidamente. |
| Saldo y comisión | Comandos autorizados y movimientos consistentes e idempotentes. | Reintentos y concurrencia no duplican cargos. |
| GPS y presencia | Permiso local, vigencia en servidor y comprobación de elegibilidad. | La pérdida de ubicación bloquea nuevas aceptaciones. No se equipara esto a demostrar autenticidad física del GPS. |
| Acceso al panel | Identidad, segundo factor y permisos por acción. | Probar usuarios y roles sin autorización. |
| Claves de servicios | Backend en Secret Manager; SDK móvil con restricciones de aplicación/API. | Revisar permisos de acceso y restricciones; mantener secretos fuera de GitHub. |
| Archivos y documentos | Acceso restringido y política de conservación. | Probar lectura ajena y eliminación conforme a la política. |

---

[Volver al índice](../../README.md)
