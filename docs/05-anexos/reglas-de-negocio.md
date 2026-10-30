# Reglas de negocio relevantes


| Regla | Aplicación y límite |
|---|---|
| Negociación | El pasajero propone un precio y el conductor responde. |
| Recomendación | FareRules contiene S/ 2.14 por km, mínimo S/ 3.00, adicional nocturno S/ 2.00 y redondeo a S/ 0.50. Son constantes locales examinadas, no una promesa de configuración productiva. |
| Orden del cálculo local | Multiplica kilómetros, agrega adicional nocturno si corresponde, aplica mínimo y redondea. Debe documentarse este orden real, no el orden distinto propuesto en la entrega anterior. |
| Hora nocturna | La regla local convierte a hora de Lima. |
| Oferta permitida | La app valida límites locales; el backend real vuelve a validar según su configuración. |
| Comisión y saldo | El servidor real aplica reglas y movimiento transaccional; la demo puede simularlos. |
| PIN | Identifica el inicio del viaje; no debe publicarse como dato legible por el conductor. |
| Lanzamiento | Se configura desde administración; no desde un interruptor de prueba de la billetera. |
| Ubicación | Apagar la ubicación desconecta al conductor y bloquea aceptación. |

---

[Volver al índice](../../README.md)
