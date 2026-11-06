# Reglas de negocio

Las siguientes reglas pertenecen al diseño de MotoYa y se verifican mediante pruebas de aceptación.

| Regla | Definición |
|---|---|
| Ruta y kilómetros | El backend consulta el proveedor de rutas. Los kilómetros enviados o calculados por un cliente no determinan el precio autoritativo. |
| Cotización | Cada quoteId vincula usuario, origen, destino, recorrido, distancia, duración, tarifa, versión de política y vencimiento. La solicitud usa una cotización válida y autorizada. |
| Tarifa base | La configuración del servidor define S/ 2.14 por km, mínimo S/ 3.00, adicional nocturno S/ 2.00 y redondeo a S/ 0.50 como valores iniciales del diseño. |
| Orden de cálculo | Multiplicar kilómetros del servidor por tarifa por km, agregar adicional nocturno si corresponde, aplicar mínimo y redondear. La política se identifica por versión. |
| Horario nocturno | Aplicar la hora del servidor convertida a Lima. El reloj del celular no decide el adicional. |
| Negociación | El pasajero propone una oferta y el conductor responde. El backend valida los límites respecto de la cotización. |
| Asignación | Una solicitud solo puede confirmar un conductor. El servidor valida disponibilidad y realiza la transición de forma consistente. |
| Saldo y comisión | El backend calcula la comisión con los kilómetros confiables del viaje. Cierre y movimiento mantienen unicidad ante reintentos. |
| PIN | El pasajero consulta el PIN privado. El conductor lo introduce y el servidor valida el inicio. |
| Presencia | El conductor requiere ubicación habilitada, permisos y presencia vigente para aceptar. El servidor verifica elegibilidad; la app refleja offline cuando pierde ubicación. |
| Recargas y pago | Las recargas acreditan saldo mediante un proceso autorizado. El pasajero paga el viaje directamente al conductor. |
| Campaña | El dueño configura condiciones tarifarias y campaña desde el panel con autorización. |
| SOS | La alerta se conserva con estado de notificación y atención. Aceptar un envío no equivale a confirmar recepción ni atención humana. |

---

[Volver al índice](../../README.md)
