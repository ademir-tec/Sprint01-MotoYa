# Componentes arquitectónicos


| Componente | Responsabilidad | Contratos o puntos identificables | Dependencia externa |
|---|---|---|---|
| Identidad y perfil | Cuenta, sesión y datos del usuario | SessionService, servicios onboarding | Auth y Firestore |
| Lugares y ubicación | Capturar posición y mostrar lugares y recorrido | LocationService y contrato de cotización del backend | GPS, HTTP y mapas |
| Cotización del recorrido | Validar puntos, consultar ruta y calcular km y tarifa | RoutingGateway y casos de cotización | Proveedor de rutas y Firestore |
| Búsqueda y ofertas | Coordinar negociación y asignación del pasajero | RideSearchUseCase, OfferService | Adaptador de prueba o Firebase |
| Viaje | Llegada, PIN, seguimiento y cierre | Servicios de viaje y casos del backend | Firestore y funciones |
| Conductores | Perfil, expediente y disponibilidad | DriverRegistrationService y presencia | Storage, Firestore y funciones |
| Billetera | Consultar saldo, movimientos y recargas | WalletService | Servicios financieros del backend |
| Seguridad y atención | SOS, sugerencias y reclamos | Servicios y operaciones de atención | Backend y panel |
| Panel | Consultas, sesiones y comandos | PanelOperations, PanelCommandGateway, PanelQuery | Adaptadores Firebase |

---

[Volver al índice](../../README.md)
