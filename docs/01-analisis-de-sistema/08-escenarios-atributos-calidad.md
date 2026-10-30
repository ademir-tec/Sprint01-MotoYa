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

## Herramientas y procedimiento de medición

Un escenario de calidad se comprueba provocando una situación y midiendo la respuesta del sistema. **Elegir una herramienta no demuestra que el escenario se cumpla.** La siguiente tabla propone cómo medir cada escenario de MotoYa.

| Escenario | Herramientas que se pueden usar | Cómo realizar la medición en MotoYa | Métrica y evidencia |
|---|---|---|---|
| EQ-01 Rendimiento | Flutter DevTools y cronómetro instrumentado en Dart; opcionalmente Firebase Performance Monitoring; k6 para el backend | Registrar el instante de pulsar «Buscar» y el de confirmar la solicitud. Repetir con la misma red y dispositivo, separando arranque frío y caliente. Medir el endpoint aparte para distinguir demora de la app y del servidor. | Latencia extremo a extremo p50/p95, cantidad de intentos y errores. Meta preliminar: p95 menor de 3 s. Guardar CSV de tiempos y captura de la herramienta. |
| EQ-02 Frescura de ubicación | Android Emulator o dos teléfonos; marcas de tiempo y logs; integración automatizada opcional | Publicar posiciones con hora de captura y recepción del servidor. Registrar cuándo se muestran en el pasajero. Comparar los tiempos con relojes sincronizados y repetir con red lenta. | Edad de posición al visualizarla, intervalo entre actualizaciones y muestras perdidas. Umbral por acordar; no confundir mapa visible con ubicación reciente. |
| EQ-03 Recuperación de red | Android Emulator / teléfono, ADB, Firebase Emulator Suite y pruebas de integración | Cortar la red durante un viaje, reintentar una operación y restaurar la conexión. Consultar el estado autoritativo y los movimientos de billetera. Repetir con un backend de pruebas configurado. | Tiempo de recuperación, operaciones repetidas y cargos duplicados. Criterio de integridad: cero duplicados en los casos ejecutados. Conservar logs e identificadores sintéticos. |
| EQ-04 Seguridad de datos | Firebase Emulator Suite y `@firebase/rules-unit-testing`; pruebas de funciones con distintos usuarios | Intentar leer documentos ajenos, escribir saldo desde el cliente e invocar funciones sin sesión o con un rol incorrecto. Verificar la respuesta y que los datos sigan iguales. | Porcentaje de intentos indebidos denegados y modificaciones indebidas: cero. Guardar reporte de reglas y pruebas del backend. Las reglas de Firestore no sustituyen la autorización dentro de Cloud Functions. |
| EQ-05 Escalabilidad | k6; Cloud Monitoring y métricas de uso de Firestore | Aumentar gradualmente solicitudes concurrentes en un entorno aislado, por ejemplo 1, 10 y 25 clientes sintéticos como ensayo inicial. Enviar solicitudes válidas y autenticadas respetando el formato callable. Revisar dobles asignaciones y movimientos, además de latencia. | p95, solicitudes por segundo, tasa de errores, instancias, lecturas/escrituras y costo. La carga objetivo definitiva está pendiente. El emulador sirve para corrección funcional, no para acreditar capacidad productiva. |
| EQ-06 SOS y fallo de notificación | Emulator Suite, doble de notificaciones que fuerce error y logs del backend; FCM con dispositivo de prueba para entrega real | Generar un SOS sintético y provocar el fallo del envío. Comprobar que la alerta queda persistida y que el estado mostrado coincide con lo ocurrido. No contactar servicios de emergencia reales. | Alertas persistidas/emitidas, tiempo de persistencia y fallos de envío. La respuesta aceptada por FCM no prueba recepción ni lectura. Guardar logs y documento de alerta; reintentos y escalamiento requieren pruebas propias. |
| EQ-07 Mantenibilidad | `flutter test`, `dart analyze` y comprobador local de arquitectura | Ejecutar los mismos casos de uso con un adaptador simulado y otro doble que cumpla el contrato de ofertas. Revisar que aplicación y dominio no importen Firebase. | Casos aprobados, dependencias prohibidas y archivos internos modificados. Criterio: conservar el contrato y cero imports externos prohibidos. Un análisis estático no demuestra por sí solo toda la mantenibilidad. |
| EQ-08 Disponibilidad | Cloud Monitoring: uptime checks o monitor sintético autenticado; Cloud Logging | Definir una operación de prueba sin efectos de negocio y observarla periódicamente durante un periodo acordado. Complementar la sonda con errores y respuestas reales. No quitar autenticación al backend para facilitar la medición. | Porcentaje de comprobaciones correctas, duración de interrupciones y alertas. Fórmula de sonda: éxitos / comprobaciones × 100. Un SLO debe indicar objetivo, ventana y qué se considera éxito; está pendiente definirlo. |
| EQ-09 Recuperabilidad | Backups y restauración de Firestore; script de comparación de datos | Restaurar un respaldo de prueba en una base separada. Comparar perfiles, viajes y movimientos mediante identificadores y campos importantes. Evaluar también Storage y Auth, que no quedan recuperados por un respaldo de Firestore. | RTO: tiempo hasta disponer de datos utilizables. RPO: antigüedad de los datos recuperables respecto del incidente. Medir registros y relaciones faltantes; ensayo y objetivos pendientes. |
| EQ-10 Ubicación desactivada | Android Emulator / teléfono, ADB, Logcat y prueba de integración | Conectar al conductor, apagar la ubicación y comprobar estado offline y retirada de presencia. Intentar aceptar desde la interfaz y, con una llamada de prueba autorizada, desde el servicio. Repetir al revocar el permiso y al volver del segundo plano. | Tiempo hasta offline, presencia residual y aceptaciones indebidas: cero en los casos ejecutados. Guardar captura, logs y resultado del backend; no basta con deshabilitar el botón. |

### Qué herramientas ya aparecen en el proyecto

| Estado observado | Herramientas |
|---|---|
| Declaradas en el código o configuración local | `flutter_test`, scripts de pruebas Node.js del backend, `@firebase/rules-unit-testing`, Firebase Emulator Suite y comprobación de casos de uso. |
| Disponibles en el entorno de desarrollo | Android Studio, Android Emulator y ADB. DevTools forma parte de las herramientas de Flutter y Dart. |
| Propuestas para incorporar o configurar | k6, trazas de Firebase Performance Monitoring, monitores de Cloud Monitoring y ensayo de restauración. Su inclusión aquí no significa que estén instaladas, instrumentadas o midiendo MotoYa actualmente. |

### Cómo empezar de forma práctica

1. **Seguridad:** desde `functions/`, ejecutar `npm run test:rules` en un entorno local preparado. Sus pruebas deben usar identidades simuladas y verificar tanto rechazo como conservación de datos. Para las funciones existen `npm test` y `npm run test:e2e`; revisar sus requisitos antes de ejecutarlas.
2. **Rendimiento:** usar un dispositivo de prueba con Flutter en modo `profile` y abrir DevTools. Para medir la búsqueda completa hace falta instrumentar inicio y fin; el tiempo de un frame no equivale al tiempo de respuesta del servidor.
3. **GPS y recuperación:** ejecutar los casos EQ-03 y EQ-10 en teléfono o emulador. App y panel deben apuntar al mismo proyecto y entorno, con servicios reales habilitados para la prueba integrada. Un adaptador fake no acredita recuperación real del backend.
4. **Carga:** preparar un script de k6 para un endpoint autorizado del entorno de pruebas, con tokens válidos y datos ficticios. No guardar claves privadas ni tokens en GitHub. La métrica HTTP de k6 no incluye todo el recorrido de la interfaz.

**p95**, explicado fácil: si se ordenan 100 tiempos de menor a mayor, aproximadamente 95 quedan dentro de ese valor. Sirve para revisar las respuestas lentas que el promedio puede ocultar.

### Formato para registrar resultados

| Campo | Qué anotar |
|---|---|
| Caso y versión | EQ-xx, versión del APK y commit del backend. |
| Entorno | Teléfono/emulador, red, proyecto de pruebas y adaptadores reales o simulados. |
| Ejecución | Fecha, número de repeticiones, datos de prueba y acción provocada. |
| Objetivo | Umbral acordado antes de la prueba. |
| Resultado | Valor medido, errores, evidencia y cumplimiento o incumplimiento. |

**Para exponer:** «Para medir la calidad no basta con que la app abra. Usaría DevTools para rendimiento, pruebas de Firebase para seguridad, k6 para carga y el emulador para simular fallas de red y GPS. En cada prueba registro una métrica y la comparo con el objetivo. Estos son los métodos propuestos; los resultados se presentan cuando se ejecuten».

Las capacidades de las herramientas pueden consultarse en la documentación oficial de [Flutter DevTools](https://docs.flutter.dev/tools/devtools), [pruebas de integración Flutter](https://docs.flutter.dev/testing/integration-tests), [trazas personalizadas de Firebase Performance](https://firebase.google.com/docs/perf-mon/custom-code-traces?platform=flutter), [pruebas de reglas Firebase](https://firebase.google.com/docs/rules/unit-tests), [métricas de k6](https://grafana.com/docs/k6/latest/using-k6/metrics/reference/), [umbrales de k6](https://grafana.com/docs/k6/latest/using-k6/thresholds/), [monitorización sintética](https://docs.cloud.google.com/monitoring/uptime-checks/introduction) y [restauración de Firestore](https://firebase.google.com/docs/firestore/backups).

---

[Volver al índice](../../README.md)
