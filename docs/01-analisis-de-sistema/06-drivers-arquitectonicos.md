# Drivers arquitectónicos


| ID | Driver | Decisión que provoca | Ejemplo MotoYa |
|---|---|---|---|
| DA-01 | Separar pruebas de servicios externos | Dependencia de interfaces | OfferService admite FakeOfferService y FirebaseOfferService. |
| DA-02 | Proteger reglas y datos financieros | Backend como autoridad en LIVE | Cierre y movimientos se validan en funciones. |
| DA-03 | Actualización de ofertas y viaje | Streams y suscripciones | El caso de uso recibe ofertas como eventos. |
| DA-04 | Mantener app y panel | Capas y organización por funcionalidad | Dominio y aplicación separados de widgets y Firebase. |
| DA-05 | Riesgo de aceptación concurrente | Transacciones y comprobación de disponibilidad | Backend de asignación y finalización. |
| DA-06 | Operación geográfica | Puertos de ubicación, rutas y búsqueda | LocationService y RoutingService. |
| DA-07 | Pruebas reproducibles | Dobles de prueba y casos aislados | Flujo de búsqueda sin conductores reales. |
| DA-08 | Acceso al transporte lejos de los paraderos y coordinación del recojo | Selección de punto de recojo, ubicación del conductor y estimación de llegada | El pasajero solicita desde su vivienda u otro lugar y se prepara mientras la moto se aproxima. |

---

[Volver al índice](../../README.md)
