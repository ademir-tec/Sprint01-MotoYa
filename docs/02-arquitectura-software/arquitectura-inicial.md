# Arquitectura inicial de la solución

MotoYa se organiza como una app móvil, un panel administrativo y un backend compartido. El estilo de comunicación es cliente-servidor y el código mantiene límites de Arquitectura Limpia.

| Elemento | Tecnología | Responsabilidad |
|---|---|---|
| App móvil | Flutter / Dart | Recojo, destino, GPS, ofertas y experiencia del viaje. |
| Panel web | Flutter Web / Dart | Operación y atención según permisos. |
| Backend | Cloud Functions / TypeScript / Node.js | Autorizar comandos, obtener ruta y distancia, cotizar y controlar estados y dinero. |
| Identidad | Firebase Auth | Identificar usuarios y personal. |
| Datos | Cloud Firestore | Cotizaciones, perfiles, solicitudes, viajes y movimientos. |
| Archivos | Cloud Storage | Expedientes y comprobantes con acceso restringido. |
| Avisos | FCM | Notificaciones con estado de envío y recepción diferenciados. |
| Rutas | Proveedor cartográfico mediante RoutingGateway | Responder al backend con recorrido, distancia y duración. |

### Flujo de cotización y solicitud

1. La app envía origen y destino al backend con la identidad del usuario.
2. El servidor valida cobertura y puntos, consulta al proveedor de rutas y calcula la distancia.
3. El servidor aplica su política tarifaria y conserva una cotización con `quoteId`, propietario, recorrido, kilómetros, duración, versión de política y vencimiento.
4. La app muestra el resultado y envía `quoteId`, oferta y forma de pago para solicitar la moto.
5. El servidor comprueba propiedad, vigencia y uso de la cotización antes de registrar la solicitud. La asignación y el cierre respetan las transacciones y permisos.

App y panel pueden realizar lecturas y escrituras acotadas por reglas, como mensajes y presencia. Saldo, comisiones, cotizaciones autoritativas y cambios críticos de viaje se controlan en servidor.


---

[Volver al índice](../../README.md)
