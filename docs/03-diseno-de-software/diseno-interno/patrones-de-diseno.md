# Patrones de diseño


| Patrón o mecanismo | Dónde se observa | Problema que resuelve | Evidencia y precisión |
|---|---|---|---|
| Adapter | FirebaseOfferService y servicios de rutas | Traducir proveedores externos a contratos internos | Los consumidores utilizan interfaces propias. |
| Puertos de servicios | OfferService, WalletService, LocationService | Evitar acoplar casos de uso a SDK | No todo servicio debe llamarse Repository para invertir dependencias. |
| Observer mediante streams | request devuelve Stream de ofertas | Actualizar estado cuando aparecen ofertas | Se debe liberar la suscripción. |
| Inyección de dependencias | Constructor del caso de uso y providers | Sustituir implementaciones | Composición entrega el contrato requerido. |
| Estrategia de selección | Adaptadores reales o simulados | Cambiar comportamiento según entorno | Se describe el mecanismo; no se inventa una clase Strategy inexistente. |
| Repositorio / persistencia abstracta | Puertos del backend y adaptador de Firestore | Mantener SDK fuera de aplicación | DocumentStore y contratos relacionados. |
| Outbox transaccional | Mejora futura del diseño anterior | Persistir avisos junto al cambio de negocio | No se presenta como patrón ya implementado. |

---

[Volver al índice](../../../README.md)
