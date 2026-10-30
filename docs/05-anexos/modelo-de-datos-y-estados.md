# Modelo de datos existente


| Colección o ruta | Uso | Observación |
|---|---|---|
| users | Perfil y referencias operativas | Acceso según propietario y permisos. |
| drivers | Registro, moto, estado y saldo | Datos sensibles y permisos separados. |
| requests | Solicitudes de pasajeros | Estado y ofertas asociadas. |
| requests/{id}/offers | Respuestas de conductores | Vinculadas a la solicitud. |
| trips | Viajes y estados | Los participantes y el backend aplican permisos distintos. |
| trips/{id}/private/pin | PIN privado del viaje | Lectura del pasajero; validación por servidor. |
| trips/{id}/messages | Chat | Participantes autorizados. |
| trips/{id}/live/driver | Posición durante el viaje | Diferente de la presencia pública aproximada. |
| presence | Conductores disponibles | Datos aproximados y vigencia. |
| walletMoves | Movimientos de saldo | Escrito por operaciones autorizadas del backend. |
| topUps | Recargas | Estado de revisión o integración. |
| config/pricing | Parámetros y campaña | La vista previa local no garantiza lectura de esta configuración. |
| sosAlerts / complaints | Alertas y reclamos | Atención y permisos del panel. |
| staff | Personal | Rol y estado del segundo factor. |

Este inventario es una selección del código local, no una exportación de producción. Cotizaciones independientes, reservas de comisión y outbox del diseño anterior se mantienen como propuestas hasta implementar y comprobar su existencia.

---

[Volver al índice](../../README.md)

## Estados de viaje en la app

La enumeración `TripPhase` está en `app/lib/domain/features/trip/trip_controller.dart`. Estos nombres pertenecen al modelo de la app y no se atribuyen automáticamente a campos de Firestore.

| Valor | Interpretación |
|---|---|
| none | No hay viaje representado en este estado de interfaz. |
| enRoute | El conductor se dirige al recojo. |
| waiting | El conductor espera al pasajero. |
| onTrip | El viaje está en curso. |
| finished | El viaje terminó. |
| noShow | Se registró la ausencia del pasajero. |
| driverCancelled | El conductor canceló. |

El recorrido normal es `enRoute → waiting → onTrip → finished`. Los estados alternativos requieren sus guardas; no toda transición entre valores es válida. El backend real vuelve a autorizar cada operación y no confía en el estado mostrado por el teléfono.
