# 02. Historias de usuario

Las historias describen el producto. El Sprint 01 entrega su especificación; no declara estas funciones implementadas. P1 identifica el núcleo del MVP y P2 una ampliación posterior al flujo esencial.

| ID | Historia | Criterio de aceptación verificable | Prioridad / requisito |
|---|---|---|---|
| HU-01 | Como pasajero quiero verificar mi celular para utilizar una cuenta propia. | Dado un código válido y vigente, al confirmarlo se abre una sesión; un código vencido se rechaza y limita reintentos. | P1 / RF-P01, RF-P02 |
| HU-02 | Como pasajero quiero elegir origen y destino para conocer una tarifa recomendada. | Con puntos dentro de cobertura, se devuelve ruta, distancia, vigencia y precio; fuera de cobertura no se crea solicitud. | P1 / RF-P04 a RF-P07 |
| HU-03 | Como pasajero quiero comparar ofertas para elegir conductor y precio. | Al aceptar una oferta vigente se asigna un único conductor y se invalidan las otras; una aceptación concurrente devuelve conflicto. | P1 / RF-P08 a RF-P11 |
| HU-04 | Como conductor quiero registrarme con documentos para acreditar mi identidad. | Un registro queda en revisión; no recibe solicitudes hasta su aprobación; una observación permite reenviar la versión corregida. | P1 / RF-C01 a RF-C05 |
| HU-05 | Como conductor quiero responder solicitudes cercanas para realizar viajes. | Solo se reciben solicitudes elegibles; la contraoferta respeta pasos de S/ 0.50, máximo +S/ 3.00 y vence a los 45 s. | P1 / RF-C06 a RF-C08 |
| HU-06 | Como pasajero quiero iniciar con PIN para reconocer mi viaje. | El conductor asignado ingresa el PIN correcto en Esperando; tres fallos alertan a soporte y bloquean nuevos intentos hasta resolución. | P1 / RF-P25, RF-C21; bloqueo propuesto |
| HU-07 | Como conductor quiero registrar la llegada y espera para transparentar el recojo. | Llegué exige distancia de hasta 100 m; no presentado exige 3 min y hasta 30 m; no genera cobro. | P1 / RF-C18, RF-P23 |
| HU-08 | Como conductor quiero terminar el viaje para registrar mi comisión. | Dos solicitudes de finalización del mismo viaje producen un solo movimiento; la promoción registra comisión cero. | P1 / RF-C13, RF-C09 |
| HU-09 | Como conductor quiero recargar saldo para continuar trabajando. | Una recarga de al menos S/ 10 queda pendiente; solo la confirmación de soporte acredita y un comprobante duplicado no acredita de nuevo. | P1 / RF-C10, RF-S04 |
| HU-10 | Como pasajero quiero compartir el viaje y pedir ayuda. | Compartir abre el flujo de WhatsApp; SOS persiste una alerta y muestra su estado de entrega; sin agente a los 2 min se escala. | P1 / RF-P14, RF-P15, RF-S27 |
| HU-11 | Como agente quiero revisar casos con evidencia para resolverlos. | La consulta del chat exige caso asociado; la resolución registra actor, motivo y fecha. | P1 / RF-S05, RF-S11, RF-S20 |
| HU-12 | Como usuario quiero alternar modos sin duplicar mi cuenta. | Con viaje activo se rechaza el cambio; sin viaje, conductor aprobado puede cambiar y se desconecta al volver a pasajero. | P1 / RF-A01, RF-A02 |
| HU-13 | Como usuario quiero controlar mis datos. | La eliminación requiere autenticación reciente, informa la retención aplicable y crea solicitud trazable de atención. | P1 / RF-P32, RF-A09 |
| HU-14 | Como usuario quiero calificar el servicio. | Solo los participantes de un viaje terminado pueden emitir una reseña cada uno, de 1 a 5 estrellas. | P2 / RF-P17, RF-C14 |

## Ejemplo de aceptación: recarga duplicada

**Dado** que una recarga ya fue confirmada, **cuando** dos agentes intentan confirmar otra solicitud con la misma identidad de comprobante, **entonces** el saldo cambia una sola vez y la segunda operación informa duplicidad, conservando la auditoría. Una captura por sí sola no prueba el abono: el agente lo contrasta con el estado de cuenta.
