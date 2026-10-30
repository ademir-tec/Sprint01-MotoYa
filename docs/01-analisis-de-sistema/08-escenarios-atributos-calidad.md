# Escenarios de calidad


Las medidas siguientes son criterios propuestos para verificar; no resultados de carga ni garantías.

| Escenario | Fuente y estímulo | Entorno y artefacto | Respuesta esperada | Medida |
|---|---|---|---|---|
| EQ-01 Rendimiento | Pasajero inicia búsqueda | Red estable, app y backend real | Solicitud procesada y visible | Medir latencia p95; meta preliminar menor de 3 s. |
| EQ-02 Frescura | Conductor publica ubicación | Viaje real activo | Mostrar posición y antigüedad | Medir edad de posición; no afirmar cumplimiento sin ejecución. |
| EQ-03 Recuperación | La red cae y vuelve | Viaje activo, servicios reales | Recuperar estado sin duplicar operación | Cero cargos duplicados en los casos definidos. |
| EQ-04 Seguridad | Usuario intenta modificar saldo ajeno | Acceso por SDK y funciones | Denegar y conservar estado | Todos los casos negativos de la suite deben ser rechazados. |
| EQ-05 Escalabilidad | Crece el número de viajes | Entorno aislado | Mantener consistencia y registrar saturación | Medir latencia, errores y costo; carga pendiente de definir y ejecutar. |
| EQ-06 Seguridad del viaje | Se activa SOS y falla el push | Backend real | Conservar alerta y comunicar estado real | Verificar persistencia; escalamiento y reintentos aún requieren evidencia. |
| EQ-07 Mantenibilidad | Se sustituye el adaptador de ofertas | Prueba aislada del caso de uso | Mantener el contrato | Pruebas aprobadas sin importar Firebase en aplicación. |
| EQ-08 Disponibilidad | Sondas prueban el servicio | Entorno de operación | Registrar respuesta o interrupción | Definir y medir SLO; no declarar disponibilidad lograda. |
| EQ-09 Recuperabilidad | Se restaura un respaldo | Dataset sintético | Recuperar datos relacionados | Ensayo de restauración pendiente. |
| EQ-10 nuevo: ubicación | Conductor apaga GPS | Conductor conectado | Pasar a desconectado, retirar presencia y bloquear aceptación | Verificar UI, servicio y ausencia de aceptación exitosa. |

---

[Volver al índice](../../README.md)
