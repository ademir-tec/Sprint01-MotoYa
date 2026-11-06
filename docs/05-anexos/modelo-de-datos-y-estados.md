# Modelo de datos y estados

Cloud Firestore organiza la información de MotoYa en colecciones y documentos. Este modelo expresa el diseño de persistencia.

| Colección o ruta | Contenido | Control |
|---|---|---|
| users | Perfil y referencias de la cuenta. | Propietario y personal autorizado. |
| drivers | Conductor, moto, expediente, disponibilidad y saldo. | Campos críticos gestionados por backend. |
| quotes | Cotización: usuario, puntos, recorrido, km, duración, tarifa, policyVersion y expiresAt. | Creación por servidor y uso sujeto a propiedad y vigencia. |
| requests | Solicitud con quoteId, oferta, pago y estado. | Backend valida y registra valores autoritativos. |
| requests/{id}/offers | Respuestas de conductores. | Elegibilidad y permisos del flujo. |
| trips | Participantes, tarifa, kilómetros confiables y estado. | Transiciones y cierre autorizados. |
| trips/{id}/private/pin | PIN de inicio. | Lectura del pasajero y validación del servidor. |
| trips/{id}/messages | Mensajes del viaje. | Participantes autorizados. |
| trips/{id}/live/driver | Ubicación durante el viaje. | Acceso limitado a los participantes. |
| presence | Disponibilidad, posición operativa y vigencia. | Caducidad y validación de elegibilidad. |
| walletMoves / topUps | Movimientos y recargas. | Acreditación y cargos desde backend. |
| config/pricing | Parámetros, versión de política, vigencia de cotización y campaña. | Personal autorizado y validación de servidor. |
| sosAlerts / complaints | Alertas, notificación y atención. | Participantes y personal según permisos. |
| staff | Rol y segundo factor. | Administración autorizada. |

### Estados de viaje de la app

El recorrido principal utiliza `enRoute` (hacia el recojo), `waiting` (espera), `onTrip` (en viaje) y `finished` (terminado). `none`, `noShow` y `driverCancelled` representan estados alternativos del modelo de interfaz.

El backend autoriza cada transición según sus condiciones. La interfaz no convierte por sí sola una transición visual en una operación válida. Los nombres del modelo de interfaz no obligan a usar exactamente el mismo campo en la base de datos.


---

[Volver al índice](../../README.md)
