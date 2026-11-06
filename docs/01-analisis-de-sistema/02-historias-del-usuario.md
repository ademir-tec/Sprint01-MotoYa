# Historias de usuario


| ID | Como… quiero… para… | Criterio de aceptación | Correspondencia |
|---|---|---|---|
| HU-01 | Como pasajero quiero verificar mi celular para acceder a mi cuenta. | Un código válido permite continuar; se informan errores y vencimiento.  | RF-P01, RF-P02 |
| HU-02 | Como pasajero quiero indicar origen y destino para consultar una recomendación. | La app muestra la cotización del backend con recorrido, distancia y tarifa; un fallo de ruta se comunica al usuario. | RF-P04 a RF-P07 |
| HU-03 | Como pasajero quiero comparar ofertas para elegir conductor. | Solo una asignación confirmada abre el viaje; un rechazo mantiene la búsqueda. | RF-P08 a RF-P11 |
| HU-04 | Como conductor quiero enviar documentos para ser evaluado. | El registro entra a revisión y permite corregir observaciones. | RF-C01 a RF-C05 |
| HU-05 | Como conductor quiero responder solicitudes cercanas para trabajar. | Solo puedo operar si cumplo las condiciones; desactivar ubicación me desconecta y bloquea la aceptación. | RF-C06 a RF-C08; control de ubicación |
| HU-06 | Como pasajero quiero utilizar un PIN para identificar mi viaje. | El inicio real exige validar el PIN en el servidor; el conductor no lo obtiene por lectura del documento privado. | RF-P25, RF-C21 |
| HU-07 | Como conductor quiero registrar mi llegada para informar al pasajero. | La implementación real comprueba estado y distancia antes de registrar la llegada. | RF-C18, RF-P23 |
| HU-08 | Como conductor quiero cerrar el viaje para registrar el resultado. | El backend realiza cierre y comisión de forma transaccional; los reintentos no deben duplicar el cargo. | RF-C13, RF-C09 |
| HU-09 | Como conductor quiero consultar y recargar mi saldo para seguir operando. | Accedo desde el perfil al saldo y movimientos; una recarga manual requiere confirmación autorizada. | RF-C10, RF-S04 |
| HU-10 | Como pasajero quiero compartir mi viaje y pedir ayuda. | Compartir abre las opciones disponibles; SOS se conserva con su estado de notificación y atención. | RF-P14, RF-P15, RF-S27 |
| HU-11 | Como agente quiero consultar y resolver casos para atender problemas. | El panel ejecuta operaciones mediante contratos y comandos autorizados. | RF-S05, RF-S11, RF-S20 |
| HU-12 | Como usuario quiero alternar modos para usar la misma cuenta. | El cambio respeta el estado operativo y no permite actuar simultáneamente en viajes incompatibles. | RF-A01, RF-A02 |
| HU-13 | Como usuario quiero solicitar la eliminación de mi cuenta para controlar mis datos. | Debe existir un flujo autorizado, política de retención y endpoint disponible; el backend ejecuta el flujo conforme a la política definida. | RF-P32, RF-A09 |
| HU-14 | Como usuario quiero calificar el viaje para expresar mi experiencia. | Solo corresponde una reseña por participante y viaje terminado en el flujo real. | RF-P17, RF-C14 |
| HU-15 | Como pasajero que vive lejos de un paradero quiero solicitar una moto desde mi ubicación para evitar desplazarme a buscarla y aprovechar el tiempo mientras llega. | Puedo indicar un punto de recojo dentro de cobertura y, tras la asignación, consultar al conductor y su llegada estimada para estar listo al arribo. | RF-P04 a RF-P07, RF-P08 a RF-P11 y seguimiento del viaje |

---

[Volver al índice](../../README.md)
