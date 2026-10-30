# Requisitos funcionales


| Grupo de requisitos | Comportamiento | Componentes relacionados | Estado y límite |
|---|---|---|---|
| RF-P01, RF-P02; RF-A01 a RF-A05 | Verificar cuenta, recuperar sesión y mantener perfil | Auth, sesión, perfil | Código y variantes demo; publicación de cada endpoint se verifica aparte. |
| RF-P03 a RF-P07 | Mostrar mapa, seleccionar lugares, ruta y recomendación | Places, rutas, FareRules | Cálculo preliminar en app; servidor todavía recibe kilómetros del cliente. |
| RF-P08 a RF-P11; RF-C06 a RF-C08 | Buscar, negociar y asignar | RideSearchUseCase, OfferService, backend de viajes | Implementaciones simuladas y Firebase seleccionables. |
| RF-P12; RF-C18; RF-P23 | Cancelar, registrar llegada y espera | Servicios de viaje | Código real en backend y simulación de exposición. |
| RF-C12, RF-C13, RF-C21; RF-P13, RF-P25 | Navegar, usar PIN y terminar | Trip, servicios conductor/pasajero | Reglas críticas en backend cuando el flujo real está activo. |
| RF-P14, RF-P15, RF-P19, RF-P26 | Compartir, contactos y SOS | Seguridad, enlaces, backend | No equivale a un servicio de emergencia atendido permanentemente. |
| RF-P22; RF-C17; RF-S13 | Chat del viaje | Mensajes y panel | Acceso condicionado a reglas y autorizaciones. |
| RF-C01 a RF-C05, RF-C25 | Registro y cambios documentales | Registro y revisión | Backend, archivos privados y pantallas existentes. |
| RF-C09 a RF-C11; RF-S04, RF-S25 | Saldo, movimientos, recargas y ajustes | WalletService y backend | Recarga manual; integración Mercado Pago requiere configuración y habilitación. |
| RF-P17, RF-C14; RF-S08 | Calificación y moderación | Reseñas y panel | Implementación local; revisar permisos y unicidad con pruebas. |
| RF-S01, RF-S07, RF-S11, RF-S14 | Acceso al panel, personal y sanciones | PanelIdentity, sesiones, operaciones | Panel local de demostración; no se afirma publicación. |
| RF-S09, RF-S12 y configuración relacionada | Tarifas y campaña | Pricing y config/pricing | La campaña se administra desde panel; el interruptor de prueba se retiró de la billetera. |
| RF-S31, RF-S32, RF-S34 | Finanzas, gastos y exportaciones | Panel y reportes | Los datos del panel demo son ficticios. |
| Ampliación GPS de RF-C06 a RF-C08 | Desconectar al conductor al apagar ubicación | Ubicación, presencia, controlador conductor | Cambio implementado; requiere verificar también en un teléfono físico. |

---

[Volver al índice](../../README.md)
