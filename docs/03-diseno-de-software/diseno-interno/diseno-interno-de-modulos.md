# Diseño interno: búsqueda y negociación


Se utiliza un módulo acotado para demostrar la separación de responsabilidades: el pasajero busca una moto y acepta una oferta.

```text
app/lib/
  domain/features/ride/
    offer_service.dart
    driver_summary.dart
    ride_search_controller.dart
  application/features/ride/
    ride_search.dart
  presentation/features/ride/
    ride_search_controller.dart
  data/features/ride/
    offer_service.dart
    firebase_offer_service.dart
  composition/features/ride/
    offer_service.dart
```

Cada archivo se ubica según su responsabilidad y sus dependencias. Los contratos y modelos del núcleo no importan widgets, clientes Firebase ni tipos propios de proveedores externos.

| Archivo o clase | Capa | Responsabilidad | Qué no debe hacer |
|---|---|---|---|
| OfferService | Dominio | Definir solicitud, cambio de oferta, aceptación y cancelación | Conocer Firebase o widgets. |
| RideRequest / DriverOffer / AcceptedRide | Dominio | Transportar quoteId, oferta y datos propios del flujo | Incluir DocumentSnapshot o elementos visuales. |
| RideSearchUseCase | Aplicación | Coordinar búsqueda, negociación, rechazo y confirmación | Construir un cliente Firebase. |
| RideSearchController | Presentación | Delegar acciones y reflejar estado en Riverpod | Reimplementar la negociación. |
| FakeOfferService | Datos | Simular el contrato para pruebas | Ejecutar pagos o viajes reales. |
| FirebaseOfferService | Datos | Traducir el contrato a servicios Firebase | Definir reglas de interfaz. |
| offerServiceProvider | Composición | Seleccionar implementación y gestionar su ciclo de vida | Decidir la tarifa de negocio. |

### Contrato existente

```dart
abstract interface class OfferService {
  Stream<DriverOffer> request(RideRequest request);
  void updatePassengerOffer(double offer);
  Future<AcceptedRide> accept(DriverOffer offer);
  void cancel({String? reason});
}
```

El caso de uso recibe OfferService. La composición selecciona FakeOfferService o FirebaseOfferService según la configuración efectiva. La composición del entorno de operación elige el adaptador Firebase; las pruebas seleccionan un doble del contrato.

La búsqueda recibe `quoteId` de una cotización del servidor. El backend resuelve ese identificador y no toma kilómetros o tarifas calculados localmente como autoridad.

### Flujo normal

| Paso | Responsable | Acción | Resultado |
|---|---|---|---|
| 1 | Pasajero / presentación | Confirma el borrador de viaje | Se solicita iniciar la búsqueda. |
| 2 | RideSearchController | Delega start al caso de uso | La interfaz no conoce el proveedor. |
| 3 | RideSearchUseCase | Invoca request mediante OfferService | Se suscribe a ofertas. |
| 4 | Adaptador seleccionado | Emite DriverOffer | Se actualiza el estado de búsqueda. |
| 5 | Pasajero / caso de uso | Selecciona una oferta e invoca accept | Se espera confirmación. |
| 6 | Adaptador | Devuelve AcceptedRide o un error | El caso de uso recibe viaje/PIN o rechazo. |
| 7 | Presentación | Refleja el estado confirmado | Continúa al viaje cuando corresponde. |

### Errores y límites

| Situación | Respuesta |
|---|---|
| Precio fuera de los límites de la cotización | Informar el rechazo del backend; la oferta se compara con una cotización vigente. |
| Conductor ya ocupado | Mostrar rechazo y conservar un estado de búsqueda válido. |
| Servicio falla | Reflejar el fallo sin inventar una asignación. |
| Usuario cierra la búsqueda | Liberar suscripciones y recursos. |
| Respuesta tardía después de cerrar | Evitar abrir un viaje desde un caso de uso ya descartado. |
| Entorno de prueba con adaptador simulado | Informar que la experiencia corresponde a una prueba. |

---

[Volver al índice](../../../README.md)
