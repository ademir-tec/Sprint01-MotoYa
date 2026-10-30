# Nivel 4: código de búsqueda y ofertas


**Pregunta:** ¿qué clases e interfaces concretas implementan el componente?

| Pieza | Tipo | Relación |
|---|---|---|
| RideSearchController | Controlador de presentación | Utiliza RideSearchUseCase. |
| RideSearchUseCase | Caso de uso | Depende de OfferService y publica RideSearchState. |
| OfferService | Interfaz del dominio | Declara request, updatePassengerOffer, accept y cancel. |
| FakeOfferService | Adaptador simulado | Implementa OfferService. |
| FirebaseOfferService | Adaptador externo | Implementa OfferService. |
| DriverOffer | Modelo | Representa una oferta de conductor. |
| AcceptedRide | Modelo | Contiene identificador de viaje y PIN. |

### Diagrama UML de clases — fuente Mermaid

```mermaid
classDiagram
  class OfferService {
    <<interface>>
    +request(request) Stream
    +updatePassengerOffer(offer) void
    +accept(offer) Future
    +cancel(reason) void
  }
  RideSearchController --> RideSearchUseCase : delega
  RideSearchUseCase --> OfferService : utiliza
  RideSearchUseCase --> RideSearchState : publica
  OfferService <|.. FakeOfferService : implementa
  OfferService <|.. FirebaseOfferService : implementa
  OfferService ..> DriverOffer : emite
  OfferService ..> AcceptedRide : devuelve
```

### Diagrama de secuencia — fuente Mermaid

```mermaid
sequenceDiagram
  actor P as Pasajero
  participant UI as Presentación
  participant CU as RideSearchUseCase
  participant S as Adaptador OfferService
  P->>UI: Buscar moto
  UI->>CU: start(draft)
  CU->>S: request(request)
  S-->>CU: DriverOffer por stream
  CU-->>UI: Estado con ofertas
  P->>UI: Elegir conductor
  UI->>CU: accept(driverId)
  CU->>S: accept(offer)
  alt Asignación confirmada
    S-->>CU: AcceptedRide
    CU-->>UI: Estado confirmado con viaje y PIN
  else Servicio rechaza
    S-->>CU: Error de aceptación
    CU-->>UI: Fallo y búsqueda actualizada
  end
```

Las dos fuentes Mermaid se visualizarán directamente en GitHub. La línea continua con flecha indica uso; la discontinua con triángulo indica implementación de una interfaz. La secuencia muestra colaboración en ejecución, no imports.

---

[Volver al índice](../../README.md)
