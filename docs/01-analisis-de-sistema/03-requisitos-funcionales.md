# Requisitos funcionales

Los requisitos describen el comportamiento que debe satisfacer MotoYa. Las validaciones críticas se aplican en el backend.

| Identificador | Comportamiento | Responsabilidad |
|---|---|---|
| RF-P01, RF-P02; RF-A01 a RF-A05 | Verificar cuenta, recuperar sesión y administrar perfil. | App, Firebase Auth y backend de perfiles. |
| RF-P03 a RF-P07 | Seleccionar puntos y visualizar mapa, recorrido, distancia y tarifa cotizada. | La app envía origen/destino. El backend consulta la ruta y genera quoteId. |
| RF-P08 a RF-P11; RF-C06 a RF-C08 | Solicitar, negociar, responder y asignar un viaje. | Backend valida cotización, oferta, disponibilidad y única asignación. |
| RF-P12; RF-C18; RF-P23 | Cancelar, registrar llegada y coordinar espera. | Backend verifica permisos, estado y condiciones del viaje. |
| RF-C12, RF-C13, RF-C21; RF-P13, RF-P25 | Navegar, validar PIN e iniciar y cerrar el viaje. | App muestra el recorrido. Backend controla transiciones y cierre. |
| RF-P14, RF-P15, RF-P19, RF-P26 | Compartir viaje, gestionar contactos y registrar SOS. | La alerta se conserva con su estado de notificación y atención. |
| RF-P22; RF-C17; RF-S13 | Intercambiar mensajes del viaje. | Participantes y personal con permisos específicos. |
| RF-C01 a RF-C05, RF-C25 | Registrar y revisar conductor, moto y documentos. | Storage privado y revisión autorizada desde panel. |
| RF-C09 a RF-C11; RF-S04, RF-S25 | Consultar saldo y movimientos; solicitar y acreditar recargas. | Solo el backend modifica saldo y registra movimientos. |
| RF-P17, RF-C14; RF-S08 | Calificar y moderar la experiencia. | Una reseña por participante y viaje terminado, con permisos. |
| RF-S01, RF-S07, RF-S11, RF-S14 | Acceder al panel y gestionar personal y sanciones. | Identidad, segundo factor y autorización por comando. |
| RF-S09, RF-S12 | Administrar tarifas y campaña de lanzamiento. | Configuración del servidor con versión de política. |
| RF-S31, RF-S32, RF-S34 | Consultar finanzas, gastos y exportaciones. | Panel y backend según rol. |
| RF-C06 a RF-C08: ubicación | Desconectar al conductor al perder ubicación o permiso y rechazar nuevas aceptaciones. | App detecta el cambio; servidor valida presencia vigente y elegibilidad. |
| RF-P32, RF-A09 | Solicitar eliminación de cuenta. | Backend autoriza y aplica la política de conservación y eliminación de datos. |

---

[Volver al índice](../../README.md)
