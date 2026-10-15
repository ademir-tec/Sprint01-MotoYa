# Estilo arquitectónico

## Elección

MotoYa combina **cliente-servidor**, **backend administrado/serverless** y **organización modular por capas**. Cloud Functions ejecuta casos de uso; Firebase aporta identidad, datos y archivos. Los módulos pueden compartir un proyecto y despliegue inicial, sin convertirse por ello en microservicios autónomos.

| Opción | Ventaja | Costo / limitación | Decisión |
|---|---|---|---|
| Backend propio monolítico y PostgreSQL/PostGIS | Transacciones y consultas espaciales robustas | Administración, despliegue y monitoreo propios | Alternativa de evolución |
| Backend modular sobre Firebase | Integración de identidad, tiempo real y persistencia | Costo por uso, dependencia y diseño cuidadoso de consultas | Elegido para el MVP |
| Microservicios por dominio | Escalado y despliegue independientes | Consistencia distribuida, observabilidad y mayor operación | No justificado en Sprint 01 |

## Comunicación

Los comandos críticos son síncronos y autenticados: aceptar oferta, validar PIN, confirmar recarga y terminar viaje. Las suscripciones muestran cambios ya confirmados. Los eventos asíncronos distribuyen avisos, reportes y tareas de seguimiento; no son la única garantía del saldo.

## Razón de la elección

El alcance inicial se concentra en una ciudad y un equipo pequeño. Separar código por dominio permite evolucionar sin asumir desde el inicio el costo de múltiples servicios. El uso de Firebase no elimina servidores físicos ni tareas operativas: delega su gestión al proveedor, mientras MotoYa conserva responsabilidad por configuración, reglas, costos y respaldo.

## Condición de revisión

Revisar esta decisión si las consultas geográficas, el costo por viaje o la contención impiden cumplir EQ-01 y EQ-05. La extracción de un servicio se justificaría con métricas y límites claros; no únicamente por cantidad de archivos.
