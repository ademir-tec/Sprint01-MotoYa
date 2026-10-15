# Reglas de negocio y parámetros del MVP

Las reglas concretan el comportamiento que condiciona la arquitectura. Los puntos señalados como propuesta se registran también en ADR-06.

| IDs | Regla |
|---|---|
| RN-01 a RN-04 | Precio recomendado: distancia de ruta válida por S/ 2.14/km, redondeado al décimo de sol, con mínimo S/ 3. Oferta del pasajero entre 70% y 200% de la recomendada, sin bajar de S/ 3; botones en pasos de S/ 0.50 |
| RN-05, RN-58, RN-59 | Radio 1.5 km, luego 2.5 km a los 20 s y 3 km a los 40 s si no hay respuestas; llegada estimada máxima de 10 min; parámetros configurables |
| RN-06 a RN-10 | Contraoferta hasta +S/ 3 en pasos de S/ 0.50; una por conductor por versión de oferta; vigencia 45 s; solicitud 3 min; precio acordado fijo |
| RN-11 a RN-15 | Comisión S/ 0.333/km planeado, redondeada al céntimo y cobrada solo al terminar; saldo bajo menor a S/ 5; recarga mínima S/ 10; cancelar no genera comisión |
| RN-16 a RN-18 | Recarga pagada fuera del sistema, verificada por soporte y no duplicable; objetivo de atención menor a 15 min de 8:00 a 20:00 |
| RN-19 a RN-22 | Registro aprobado, documentos vigentes y TIV coincidente con identidad; baja calificación pasa a revisión |
| RN-23 | SOS permanece en historial y requiere atención operativa 24 horas |
| RN-24 a RN-27 | Rutas y cobertura validadas; servidor decide distancia; el respaldo solo opera cuando esté desplegado |
| RN-28 a RN-30 | Primeros 30 días de campaña común: sin comisión ni exigencia de saldo; guardar comisión teórica separada |
| RN-31 a RN-38 | Llegada hasta 100 m; 5 min gratis; luego S/ 0.50/min; no presentado desde 3 min a hasta 30 m; cancelar nunca cobra al pasajero; advertencias caducan en 90 días |
| RN-39 a RN-41 | Chat desde asignación hasta cierre o cancelación; conservación 90 días y acceso de soporte justificado |
| RN-61 a RN-63 | Revisar ubicación simulada; PIN de 4 dígitos y alerta tras 3 fallos; aviso ante parada mayor a 7 min o desvío mayor a 500 m; sin respuesta en 60 s activar SOS |
| RN-69 a RN-72 | Cuenta única; cambio de modo sin solicitud/viaje activo; conductor aprobado; sanciones afectan ambos modos; tercera advertencia activa suspende hasta revisión |
| RN-73 a RN-76 | Avatar prediseñado para pasajero, selfie verificada para conductor, alias único y cambio de celular verificado limitado a una vez cada 30 días |

## Fórmulas propuestas y casos límite

Se usa zona horaria **America/Lima** para la campaña y la tarifa nocturna; los eventos se guardan con tiempo de servidor en UTC.

```text
base = max(3.00, redondearAlDecimo(kmPlaneados * 2.14))
nocturno = 2.00 si hora >= 23:00 o hora < 04:30; en otro caso 0.00
recomendada = base + nocturno
minOferta = techoAlDecimo(max(3.00, recomendada * 0.70))
maxOferta = pisoAlDecimo(recomendada * 2.00)
comisionTeorica = redondearAlCentimo(kmPlaneados * 0.333)
comision = 0.00 durante campaña; en otro caso comisionTeorica
recargoEspera = 0.50 * minutosCompletos(max(0, inicioViaje - llegada - 5 min))
totalPasajero = precioAcordado + recargoEspera
```

El intervalo nocturno excluye las 04:30. El recargo por minutos completos y el orden mínimo/nocturno son propuestas pendientes de aprobación. El precio y la comisión se congelan con la cotización aceptada; la campaña se evalúa según su instante de cotización, como propuesta de consistencia. El recargo se congela al iniciar; no aumenta durante el trayecto.

| Caso | Resultado esperado |
|---|---|
| 3.25 km diurnos | Recomendada S/ 7.00; comisión S/ 1.08 |
| 3.25 km nocturnos | Recomendada S/ 9.00; comisión S/ 1.08 |
| 1 km diurno | Recomendada S/ 3.00; comisión S/ 0.33 |
| 4.5 km durante campaña | Comisión S/ 0.00; teórica S/ 1.50 |
| Inicio a 5:59 de llegada | Recargo S/ 0.00, bajo propuesta de minutos completos |
| Inicio a 6:00 de llegada | Recargo S/ 0.50 |
| Cancelación después de llegada | Cero cobro y comisión; advertencia según reglas |

## Reglas de integridad adicionales del diseño

- Una reserva de comisión no altera el ledger; garantiza saldo hasta finalizar. Los ajustes no consumen fondos reservados.
- La finalización repetida no crea otro movimiento, incluso usando una nueva clave de petición.
- Confirmar recarga usa una clave compuesta de proveedor, cuenta receptora y referencia normalizada; se debe confirmar con la operación real qué atributos identifican inequívocamente un abono.
- El envío repetido de una alerta conserva trazabilidad, sin generar sanciones automáticas duplicadas.
- El PIN se protege en almacenamiento separado y se limita el número de intentos. Se propone bloqueo tras tres fallos hasta revisión; no se registra el PIN en logs.
