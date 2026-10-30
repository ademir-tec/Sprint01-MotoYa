# Componentes arquitectónicos


| Componente | Responsabilidad | Contratos o puntos identificables | Dependencia externa |
|---|---|---|---|
| Identidad y perfil | Cuenta, sesión y datos del usuario | SessionService, servicios onboarding | Auth y Firestore |
| Lugares y ubicación | Obtener posición, buscar y trazar ruta | LocationService, RoutingService | GPS, HTTP y mapas |
| Búsqueda y ofertas | Coordinar negociación y asignación del pasajero | RideSearchUseCase, OfferService | Adaptador demo o Firebase |
| Viaje | Llegada, PIN, seguimiento y cierre | Servicios de viaje y casos del backend | Firestore y funciones |
| Conductores | Perfil, expediente y disponibilidad | DriverRegistrationService y presencia | Storage, Firestore y funciones |
| Billetera | Consultar saldo, movimientos y recargas | WalletService | Servicios financieros del backend |
| Seguridad y atención | SOS, sugerencias y reclamos | Servicios y operaciones de atención | Backend y panel |
| Panel | Consultas, sesiones y comandos | PanelOperations, PanelCommandGateway, PanelQuery | Adaptadores Firebase |

---

[Volver al índice](../../README.md)
