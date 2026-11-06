# Patrones de diseño


| Patrón o mecanismo | Aplicación en el diseño | Problema que resuelve | Regla de diseño |
|---|---|---|---|
| Adapter | FirebaseOfferService y adaptador de rutas del backend | Traducir proveedores externos a contratos internos | Los consumidores utilizan interfaces propias. |
| Puertos de servicios | OfferService, WalletService, LocationService | Evitar acoplar casos de uso a SDK | No todo servicio debe llamarse Repository para invertir dependencias. |
| Observer mediante streams | request devuelve Stream de ofertas | Actualizar estado cuando aparecen ofertas | Se debe liberar la suscripción. |
| Inyección de dependencias | Constructor del caso de uso y providers | Sustituir implementaciones | Composición entrega el contrato requerido. |
| Estrategia de selección | Adaptadores de operación o de pruebas | Cambiar comportamiento según entorno | La composición selecciona la implementación del contrato. |
| Repositorio / persistencia abstracta | Puertos del backend y adaptador de Firestore | Mantener SDK fuera de aplicación | DocumentStore y contratos relacionados. |

---

[Volver al índice](../../../README.md)
