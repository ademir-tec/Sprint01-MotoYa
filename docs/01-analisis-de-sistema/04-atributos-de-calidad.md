# 04. Atributos de calidad

Las cifras siguientes son objetivos del producto, pendientes de medición sobre infraestructura real. No son resultados de pruebas del Sprint 01.

| Atributo | Requisito / objetivo | Consecuencia arquitectónica |
|---|---|---|
| Rendimiento | RNF-01: entrega de solicitud menor a 3 s; RNF-02: ubicación cada 3 a 5 s en viaje | Filtrado geográfico, suscripciones acotadas y medición extremo a extremo |
| Rendimiento móvil | RNF-03: inicio menor a 4 s en Android 9 y 2 GB RAM | Carga diferida y trabajo de red fuera del renderizado |
| Disponibilidad | RNF-08: 99.5% mensual | Monitoreo sintético de flujos críticos y recuperación controlada |
| Escalabilidad | RNF-09: 2,000 conductores y 300 viajes simultáneos | Evitar barridos completos y documentos globales de escritura frecuente |
| Tolerancia a fallos | RNF-07: viaje persistente pese a cortes | Servidor autoritativo, relectura de estado e idempotencia |
| Seguridad | RNF-10, RNF-11, RNF-18: transporte cifrado, documentos privados, segundo factor y detección de ubicación sospechosa | Autorización en servidor y verificación de telemetría |
| Auditabilidad | RNF-17: trazabilidad de viajes, recargas y alertas durante 2 años | Metadatos de auditoría separados del chat y del recorrido detallado |
| Recuperabilidad | RNF-21: respaldo diario, 30 días de conservación y restauración mensual | Copias de base y archivos, más ejercicio de restauración |
| Usabilidad | RNF-14, RNF-16: flujo breve, contraste AA y controles de 48 dp | Probar recorrido con usuarios y legibilidad en exterior |
| Compatibilidad | RNF-04: Android 8+; iOS posterior | Validar mínimo real de SDKs antes de fijar versiones |
| Eficiencia | RNF-05, RNF-06: menos de 40 MB de descarga y 60 MB de datos por 8 h | Medición en equipo real, telemetría adaptativa y límites de descarga |
| Mantenibilidad | Servicios externos intercambiables | Puertos de dominio, adaptadores y pruebas de contrato |

La periodicidad de captura no garantiza entrega: se mide por separado la edad de la última ubicación recibida. Una ubicación antigua debe mostrarse como desactualizada, sin simular movimiento nuevo.

Con 300 viajes y un envío por conductor cada 5 s se generan unas 60 actualizaciones/s, antes de lecturas y reintentos. Si además 1,700 conductores libres reportan cada 60 s, se añaden unas 28 actualizaciones/s. Es una estimación de carga para el diseño, no un cálculo de costo ni una prueba de capacidad.
