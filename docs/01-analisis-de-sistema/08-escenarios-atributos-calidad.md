# Escenarios de atributos de calidad de MotoYa

Los escenarios permiten evaluar la app, el panel administrativo y el backend mediante situaciones concretas y respuestas medibles.

**Las metas numéricas son propuestas para la evaluación académica: requieren aprobación y pruebas. No son resultados obtenidos ni garantías del servicio.** Se conservan los códigos EQ-01 a EQ-10 del entregable anterior.

## EQ-01. Rendimiento: solicitud de un viaje

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Rendimiento. |
| Fuente | Pasajero. |
| Estímulo | Confirma el origen y el destino e inicia la búsqueda de un conductor. |
| Condición | App y backend de pruebas conectados, red estable, dispositivo y datos documentados; distinguir arranque frío y caliente. |
| Respuesta esperada | Registrar la solicitud y mostrar su confirmación sin bloquear la interfaz. La espera de una oferta se evalúa por separado. |
| Medida | Propuesta por validar: p95 menor de 3 segundos desde pulsar «Buscar» hasta mostrar la confirmación, con menos del 1 % de errores técnicos en al menos 100 intentos. |
| Verificación | Instrumentar inicio y fin en la app, calcular tiempos y errores; medir el backend aparte para localizar la demora. |
| Estado | Pendiente de aprobar metas, instrumentar y ejecutar la medición. |

## EQ-02. Frescura de información: ubicación del conductor

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Frescura de información y rendimiento. |
| Fuente | Celular del conductor. |
| Estímulo | Publica una nueva posición durante el viaje. |
| Condición | Viaje activo, GPS y red disponibles; relojes sincronizados y marcas de captura, recepción y visualización. |
| Respuesta esperada | Mostrar una posición reciente; evitar presentar una ubicación antigua como actual. |
| Medida | Propuesta por validar: edad de posición de hasta 10 segundos en al menos el 95 % de 100 actualizaciones. Registrar intervalos y muestras perdidas. |
| Verificación | Comparar hora de captura y visualización en dos dispositivos; repetir con red degradada y comprobar la advertencia de desactualización. |
| Estado | Pendiente de aprobar el objetivo y obtener evidencia en dispositivos. |

## EQ-03. Recuperación: pérdida temporal de conexión

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Recuperación e integridad. |
| Fuente | Interrupción de la red móvil o Wi-Fi. |
| Estímulo | La conexión cae durante el viaje y el usuario reintenta una operación. |
| Condición | Viaje activo en pruebas, con acceso posterior al estado del servidor y a los movimientos de billetera. |
| Respuesta esperada | Informar la desconexión y recuperar el estado válido al volver la red, sin duplicar asignaciones, comisiones ni movimientos. |
| Medida | Propuesta por validar: recuperar el estado en hasta 15 segundos desde que vuelve una conexión utilizable, en al menos el 95 % de 20 ciclos; cero operaciones financieras duplicadas en los casos ejecutados. |
| Verificación | Cortar y restaurar la red, repetir solicitudes y comparar estado final, identificadores y movimientos. |
| Estado | Pendiente de aprobar el tiempo objetivo y ejecutar los casos de reintento. |

## EQ-04. Seguridad: protección de saldo y operaciones privadas

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Seguridad e integridad de datos. |
| Fuente | Usuario sin sesión, sin permisos o que intenta acceder a otra cuenta. |
| Estímulo | Intenta leer documentos ajenos, escribir un saldo desde el cliente o ejecutar una función administrativa. |
| Condición | Cuentas sintéticas de pasajero, conductor y personal; acceso por SDK y por funciones del backend. |
| Respuesta esperada | Rechazar el acceso indebido, conservar los datos originales y evitar exponer información privada. |
| Medida | Denegar el 100 % de los intentos indebidos de la suite acordada; cero cambios indebidos y cero datos sensibles expuestos en las respuestas revisadas. Los accesos válidos de control deben funcionar. |
| Verificación | Probar reglas de Firestore/Storage y autorización de Cloud Functions por separado; comparar datos antes y después. |
| Estado | Existen reglas y pruebas en el proyecto; falta registrar una evaluación completa de la matriz de permisos sobre una versión concreta. |

**Límite de la tarifa:** el backend recalcula el precio, pero aún recibe los kilómetros enviados por la app. Obtener la ruta y distancia independientemente en el servidor es una mejora pendiente; este escenario no acredita su implementación.

## EQ-05. Escalabilidad: solicitudes simultáneas

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Escalabilidad y rendimiento. |
| Fuente | Varios pasajeros y conductores. |
| Estímulo | Aumentan las búsquedas, consultas e intentos de aceptación. |
| Condición | Backend desplegado en un entorno aislado, datos sintéticos y solicitudes válidas y autenticadas. |
| Respuesta esperada | Atender la carga sin asignar un viaje a dos conductores ni registrar movimientos financieros duplicados. |
| Medida | Ensayo propuesto: 1, 10 y 25 usuarios virtuales, 5 minutos por etapa; p95 del endpoint elegido menor de 3 segundos, menos del 1 % de errores técnicos y cero dobles asignaciones o cargos. Registrar uso y costo. |
| Verificación | Ejecutar carga progresiva; separar rechazos de negocio esperados de errores técnicos; revisar consistencia al finalizar. |
| Estado | Pendiente de aprobar carga y entorno y ejecutar. Los 25 usuarios son un ensayo inicial, no la capacidad máxima de MotoYa. |

## EQ-06. Seguridad del viaje: SOS con fallo de notificación

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Fiabilidad de alertas y seguridad del viaje. |
| Fuente | Pasajero o conductor. |
| Estímulo | Activa SOS mientras falla el envío de notificaciones. |
| Condición | Viaje sintético, backend accesible y fallo provocado con un adaptador de prueba, sin contactar emergencias reales. |
| Respuesta esperada | Conservar la alerta y comunicar un estado coherente, sin afirmar que llegó una notificación cuyo envío falló. |
| Medida | Propuesta por validar: conservar el 100 % de las alertas de 20 casos definidos; p95 de persistencia menor de 3 segundos; ningún envío fallido presentado como entrega confirmada. |
| Verificación | Forzar el error y revisar alerta, respuesta y mensaje mostrado. Evaluar la entrega real mediante otra prueba con un dispositivo receptor. |
| Estado | Pendiente de ejecutar el fallo. Persistencia, entrega y atención son hechos distintos; reintentos y escalamiento requieren evidencia propia. |

## EQ-07. Mantenibilidad: sustitución del adaptador de ofertas

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Mantenibilidad y testabilidad. |
| Fuente | Equipo de desarrollo. |
| Estímulo | Sustituye el proveedor de ofertas conservando el contrato OfferService. |
| Condición | Caso de uso separado de adaptadores y pruebas del mismo contrato. |
| Respuesta esperada | Concentrar el cambio en el adaptador y su composición, conservando reglas y comportamiento del caso de uso. |
| Medida | Aprobar todas las pruebas de contrato y regresión acordadas; cero imports prohibidos en dominio/aplicación; cero cambios internos atribuibles únicamente al cambio de proveedor. |
| Verificación | Ejecutar las mismas pruebas con dos implementaciones o dobles, revisar el diff y comprobar dependencias de arquitectura. |
| Estado | Existen contratos, adaptadores y controles; falta registrar una sustitución concreta y sus resultados. |

## EQ-08. Disponibilidad: acceso al servicio

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Disponibilidad. |
| Fuente | Usuarios y sondas de monitoreo. |
| Estímulo | Intentan acceder periódicamente al backend. |
| Condición | Servicio desplegado, operación de prueba sin efectos de negocio y monitoreo con la autenticación necesaria. |
| Respuesta esperada | Responder correctamente y registrar interrupciones para su atención. |
| Medida | Propuesta por validar: al menos 99,5 % de comprobaciones correctas durante 30 días, con una sonda cada minuto. Acordar timeout, respuesta válida, mantenimiento y tratamiento de muestras faltantes. |
| Verificación | Calcular éxitos / comprobaciones realizadas × 100 y revisar interrupciones con logs. La proporción describe la sonda, no toda la experiencia de usuarios. |
| Estado | Pendiente de aprobar el objetivo, configurar monitoreo y completar el periodo. |

## EQ-09. Recuperabilidad: restauración de datos

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Recuperabilidad. |
| Fuente | Pérdida o corrupción de datos. |
| Estímulo | Se solicita recuperar datos desde un respaldo. |
| Condición | Conjunto sintético, respaldo y procedimiento documentados y base de destino separada de producción. |
| Respuesta esperada | Recuperar documentos y relaciones relevantes e identificar la información no cubierta por el respaldo. |
| Medida | Propuesta por validar: RTO de hasta 60 minutos y RPO de hasta 24 horas; recuperar correctamente el 100 % de documentos y relaciones esperados del conjunto de prueba. |
| Verificación | Cronometrar hasta disponer de datos utilizables; medir antigüedad del respaldo respecto del incidente y comparar identificadores, campos y relaciones. |
| Estado | Pendiente de aprobar objetivos, configurar respaldos y restaurar. Un respaldo de Firestore no restaura por sí solo archivos de Storage ni cuentas de Auth. |

## EQ-10. Disponibilidad del conductor: ubicación desactivada

| Elemento | Descripción |
|---|---|
| Atributo de calidad | Consistencia del estado y seguridad operativa. |
| Fuente | Conductor o sistema operativo. |
| Estímulo | Desactiva la ubicación o revoca su permiso mientras figura en línea. |
| Condición | Conductor conectado y solicitudes disponibles en el backend de pruebas; repetir al volver del segundo plano. |
| Respuesta esperada | Mostrar offline, retirar presencia y bloquear nuevas aceptaciones. |
| Medida | Propuesta por validar: offline y retirada de presencia en hasta 5 segundos desde detectar la desactivación con red disponible; cero aceptaciones exitosas después de invalidar disponibilidad en 20 casos. Si también se pierde red, medir aparte la caducidad de presencia en servidor. |
| Verificación | Apagar GPS y revocar permiso; comprobar interfaz, presencia y rechazo desde el servicio, no solo el botón. |
| Estado | Pendiente de ejecutar y documentar el escenario completo en emulador y teléfono real. |

## Resumen de escenarios

| Código | Atributo de calidad | Qué se busca comprobar |
|---|---|---|
| EQ-01 | Rendimiento | Confirmar el registro de la solicitud dentro del tiempo objetivo. |
| EQ-02 | Frescura de información | Mostrar una ubicación reciente y reconocer datos antiguos. |
| EQ-03 | Recuperación e integridad | Recuperar el viaje sin duplicar operaciones. |
| EQ-04 | Seguridad | Impedir accesos y cambios sin autorización. |
| EQ-05 | Escalabilidad | Mantener tiempos y consistencia ante carga simultánea. |
| EQ-06 | Fiabilidad de alertas | Conservar el SOS y comunicar el fallo de notificación. |
| EQ-07 | Mantenibilidad | Cambiar un adaptador respetando contratos y dependencias. |
| EQ-08 | Disponibilidad | Observar acceso al servicio y registrar interrupciones. |
| EQ-09 | Recuperabilidad | Restaurar los datos dentro de los objetivos acordados. |
| EQ-10 | Consistencia del estado | Impedir nuevas aceptaciones cuando el conductor pierde ubicación. |

## Cuadro de herramientas para la medición

| Escenario | Herramientas que se usarían | Cómo se usarían en MotoYa | Evidencia que se guardaría |
|---|---|---|---|
| EQ-01 | Flutter DevTools, `Stopwatch` de Dart y, opcionalmente, Firebase Performance Monitoring. | Instrumentar inicio y confirmación; revisar bloqueos y separar tiempos de app y backend. DevTools solo no mide todo el recorrido. | Tiempos por intento, p50/p95, errores y perfil de ejecución. |
| EQ-02 | Dos teléfonos o emuladores, logs y marcas de tiempo. | Comparar captura, recepción y visualización con relojes sincronizados. | Edad de posición, intervalos y muestras perdidas. |
| EQ-03 | Android Emulator o teléfono, ADB, Logcat y Firebase Emulator Suite para casos funcionales. | Cortar y recuperar red; repetir operaciones y consultar estado y movimientos. | Tiempo de recuperación, logs e identificadores para detectar duplicados. |
| EQ-04 | Firebase Emulator Suite, `@firebase/rules-unit-testing` y pruebas Node.js de Cloud Functions. | Simular roles; probar reglas y autorización del backend por separado. | Casos permitidos/denegados y datos antes y después. |
| EQ-05 | k6, Cloud Monitoring y métricas de uso de Firestore. | Generar usuarios virtuales con tokens válidos y formato callable/HTTP correcto; observar tiempos, errores y consistencia. | Reporte de carga, p95, errores, recursos y revisión de asignaciones y cargos. |
| EQ-06 | Pruebas del backend, doble de notificaciones que fuerce fallos, logs y dispositivo de prueba con FCM. | Provocar el fallo y comprobar persistencia y estado comunicado. Separar aceptación del envío, entrega al dispositivo y atención humana. | Documento de alerta, tiempos, resultado de envío y registro del receptor si se evalúa entrega. |
| EQ-07 | `flutter test`, `dart analyze`, comprobador de arquitectura y diff de Git. | Ejecutar pruebas de contrato, revisar imports y archivos modificados. | Reporte de pruebas, dependencias prohibidas y diff. |
| EQ-08 | Cloud Monitoring: uptime checks o monitor sintético autenticado; Cloud Logging. | Ejecutar sondas periódicas y registrar respuesta, errores e interrupciones. | Historial de sondas, porcentaje de éxito y duración de interrupciones. |
| EQ-09 | Respaldos y restauración de Firestore; script de comparación. | Restaurar en una base separada y contrastar documentos y relaciones. | Tiempo de restauración, antigüedad del respaldo y datos faltantes o distintos. |
| EQ-10 | Android Emulator o teléfono, ADB, Logcat y pruebas de integración. | Desactivar GPS o permiso y comprobar offline, retirada de presencia y rechazo al aceptar. | Tiempos, capturas, logs y resultados de aceptación. |

### Herramientas existentes y propuestas

| Situación | Herramientas |
|---|---|
| Declaradas en el proyecto | `flutter_test`, pruebas Node.js del backend, `@firebase/rules-unit-testing` y configuración de Firebase Emulator Suite. |
| Disponibles en el entorno de desarrollo | Android Studio, Android Emulator, ADB y herramientas de Flutter/Dart como DevTools. |
| Por incorporar, instrumentar o configurar para esta evaluación | k6, trazas de Firebase Performance Monitoring, monitores de Cloud Monitoring, automatización integrada de escenarios y procedimiento de respaldo/restauración. |

Firebase Emulator Suite permite verificar comportamiento funcional, pero no acredita rendimiento, capacidad ni disponibilidad de producción. Para pruebas integradas, app, panel y backend deben apuntar al mismo proyecto de pruebas con los servicios reales habilitados; los adaptadores demo simulan comportamientos.

### Términos para explicar las medidas

- **p95:** aproximadamente el 95 % de los tiempos queda dentro de ese valor; permite observar demoras que el promedio puede ocultar.
- **RTO:** tiempo objetivo para recuperar datos utilizables desde el inicio del procedimiento de restauración definido.
- **RPO:** máxima antigüedad aceptable de los datos recuperables respecto del incidente; representa la ventana de posible pérdida.
- **Usuario virtual:** cliente simulado por una herramienta; no equivale automáticamente a una persona ejecutando todo el flujo móvil.

Por cada prueba se guardarán: código del escenario, fecha, versión del APK y backend, entorno, red, número de intentos, objetivo, resultado y evidencia. Los resultados se registrarán cuando se ejecuten las pruebas.

**Para exponer:** «Cada escenario plantea una situación y una respuesta medible. Por ejemplo, apagamos el GPS del conductor y comprobamos si pasa a offline y deja de aceptar solicitudes. Usaríamos el emulador y los logs para registrar qué ocurre y cuánto tarda. Las metas son propuestas y se validan con evidencia».

---

[Volver al índice](../../README.md)
