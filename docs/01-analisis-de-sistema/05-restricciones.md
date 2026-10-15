# 05. Restricciones, supuestos y riesgos

| ID | Restricción | Efecto |
|---|---|---|
| R-01 | Operación inicial en cinco distritos de Huamanga | Validar origen y destino en zona configurada; mientras se define, radio provisional de 10 km desde Plaza Mayor |
| R-02 | Android primero y conectividad irregular | Recuperación de sesión y estado, reintentos controlados y pruebas en gama baja |
| R-03 | Pago al conductor fuera de la app | No almacenar tarjetas ni confirmar pagos de viajes mediante una pasarela |
| R-04 | Verificación documental humana | La aprobación no se obtiene solo cargando archivos |
| R-05 | Saldo y comisión administrados por servidor | Ningún comando acepta saldo final ni comisión calculada por cliente |
| R-06 | Presupuesto inicial limitado | Preferir servicios administrados; medir consumo y limitar consultas |
| R-07 | Datos personales y ubicación sensibles | Acceso mínimo, retención por clase de dato y revisión normativa antes de operar |
| R-08 | Documentación como alcance del sprint | No inventar despliegues, resultados de carga ni pruebas del prototipo |

## Supuestos de diseño

Adopto Flutter y Riverpod en móvil, Flutter Web en el panel y Cloud Functions con TypeScript para los comandos. El proyecto Firebase tendrá entornos separados. El respaldo GraphHopper/Photon solo estará disponible cuando se despliegue y mantenga; hasta entonces no se promete continuidad automática ante una falla de mapas.

## Riesgos

| Riesgo | Impacto | Mitigación / condición de cierre |
|---|---|---|
| Costo de lecturas y rutas | Presupuesto insuficiente | Limitar listeners, deduplicar consultas y medir por viaje |
| Dos aceptaciones simultáneas | Asignación doble | Bloqueos lógicos por usuario en transacción |
| Recarga fraudulenta o repetida | Saldo sin respaldo | Revisión humana, clave única y auditoría |
| GPS manipulado o impreciso | Llegadas y sanciones incorrectas | Precisión, antigüedad y coherencia física; revisión de casos dudosos |
| Ausencia de personal ante SOS | Alerta no atendida | Definir cobertura operativa y ensayar escalamiento antes del piloto |
| Integración con proveedores | Dependencia tecnológica | Adaptadores y errores normalizados; prueba real del proveedor |
| Reglas contradictorias | Implementaciones distintas | Resolver en ADR-06 y mantener configuración versionada |

No se asume que App Check o un identificador de instalación identifiquen de forma infalible a una persona o equipo. Son señales adicionales y no sustituyen identidad, autorización ni análisis de fraude.
