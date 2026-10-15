# Trazabilidad y plan de validación

## Matriz de trazabilidad

| Requisitos | Historias / regla | Driver | Decisión / componente | Prueba prevista |
|---|---|---|---|---|
| RF-P01, RF-P02, RF-A01, RF-A02 | HU-01, HU-12 / RN-69 a RN-72 | DA-07 | ADR-05 / Identidad | PV-01 |
| RF-P04 a RF-P07 | HU-02 / RN-01 a RN-04 | DA-06 | ADR-04, ADR-06 / Tarifas | PV-06 |
| RF-P08 a RF-P11, RF-C07, RF-C08 | HU-03, HU-05 / RN-08, RN-09 | DA-02 | ADR-03 / Despacho | PV-02 |
| RF-C13, RF-C09 | HU-08 / RN-11, RN-28 | DA-01 | ADR-03 / Viajes y Billetera | PV-03 |
| RF-C10, RF-S04 | HU-09 / RN-18 | DA-01 | ADR-03 / Billetera | PV-04 |
| RF-P25, RF-C21 | HU-06 / RN-62 | DA-04 | ADR-05 / Viajes | PV-05 |
| RF-C18, RF-P23 | HU-07 / RN-31 a RN-38 | DA-04 | ADR-06 / Viajes | PV-07 |
| RF-P15, RF-S05, RF-S27 | HU-10 / RN-23, RN-63 | DA-04 | ADR-05 / Seguridad | EQ-06 |
| RF-S01, RF-S11, RF-S20 | HU-11 / acceso por caso | DA-07 | ADR-05 / Administración | EQ-04 |
| RF-P32, RF-A09 | HU-13 / retención | DA-07 | ADR-05, ADR-06 / Identidad | PV-08 |
| RNF-01, RNF-02, RNF-09 | Búsqueda y seguimiento | DA-03, DA-08 | ADR-01 / Geolocalización | EQ-01, EQ-02, EQ-05 |
| RNF-07, RNF-21 | Recuperación | DA-05 | ADR-03 / Persistencia | EQ-03, EQ-09 |

## Pruebas funcionales propuestas

| ID | Preparación y estímulo | Resultado esperado |
|---|---|---|
| PV-01 | Usuario suspendido cambia de modo o envía comando directamente | Ambos modos bloqueados; ningún cambio persistido |
| PV-02 | Dos pasajeros aceptan ofertas del mismo conductor simultáneamente; repetir también dos ofertas para una solicitud | Solo una asignación por conductor y solicitud; una reserva; perdedor recibe conflicto |
| PV-03 | Finalizar viaje dos veces, con misma clave y después con otra; simular pérdida de respuesta | Un débito base, una liberación y mismo cierre; campaña produce cero débito efectivo |
| PV-04 | Dos agentes confirman el mismo comprobante a la vez; repetir en otra recarga | Un crédito y registro de duplicidad, sin saldo adicional |
| PV-05 | Intentar iniciar con PIN erróneo tres veces y consultar el secreto como conductor | Viaje sigue Esperando; alerta y bloqueo propuesto; secreto inaccesible |
| PV-06 | Cotizar 1 km y 3.25 km; cruzar 23:00/04:30; modificar tarifa tras aceptación | Valores del anexo; precio aceptado conserva instantánea |
| PV-07 | Llegada a 101/100 m; no presentado a 2:59/3:00 y 31/30 m; esperar 5:59/6:00 | Guardas y recargos coherentes; ninguna cancelación cobra al pasajero |
| PV-08 | Solicitar eliminación y ejecutar retención sobre dataset sintético | Perfil eliminado o anonimizado según política, datos retenidos restringidos y chat expirado no accesible |
| PV-09 | Cancelar con reserva activa y luego reintentar; ajuste intenta consumir reserva | Reserva liberada una sola vez; ajuste incompatible rechazado |

## Estrategia de pruebas posteriores

- **Unitarias:** tarifa, comisión, estados, espera, permisos y política de campaña con reloj controlado.
- **Contrato:** rutas, repositorios y notificaciones, incluyendo fallos y unidades.
- **Integración:** transacciones, reglas de Firestore/Storage, SDK directo no autorizado y deduplicación en entorno aislado.
- **Extremo a extremo:** flujo pasajero-conductor-soporte, sin datos reales ni pagos reales.
- **Carga y recuperación:** escenarios EQ con resultados, configuración y limitaciones documentadas.

## Estado del Sprint 01

La revisión de esta entrega es documental: cobertura de las secciones, vínculos, fórmulas de ejemplo, coherencia de nombres, diagramas y trazabilidad. **PV y EQ son pruebas planificadas, no ejecutadas contra una aplicación.** No se reportan resultados de pruebas del repositorio privado de MotoYa.

## Criterio de aceptación del entregable

Debe poder recorrerse desde README hasta el nivel de código sin cambiar nombres de sistemas ni tecnologías; cada decisión relevante indica motivo, consecuencia y forma de validación. Ninguna función pendiente se presenta como desplegada y ninguna meta se presenta como resultado medido.
