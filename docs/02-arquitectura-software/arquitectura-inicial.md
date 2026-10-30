# Arquitectura inicial y evolución


La primera versión permitía recorrer la experiencia mediante simulaciones. La evolución mantiene esos adaptadores para demostración y añade servicios Firebase, separando responsabilidades en capas. La refactorización cambia la organización y las dependencias del código; no activa por sí misma los servicios productivos.

| Elemento | Responsabilidad | Tecnología |
|---|---|---|
| App | Experiencia de pasajero y conductor | Flutter / Dart |
| Panel | Atención y administración | Flutter Web / Dart |
| Backend | Validar comandos y aplicar reglas críticas | Cloud Functions / TypeScript |
| Identidad | Verificación y sesión | Firebase Auth |
| Persistencia | Datos operativos y suscripciones | Cloud Firestore |
| Archivos | Expedientes y capturas según reglas | Cloud Storage |
| Mapas y rutas | Visualización, direcciones y recorrido | Google o proveedores alternativos configurados |

El móvil realiza lecturas y suscripciones permitidas por reglas. Envía comandos al backend para cambios críticos. Algunas escrituras específicas, como mensajes y presencia, utilizan permisos acotados; decir que el cliente nunca escribe ningún dato sería incorrecto.

---

[Volver al índice](../../README.md)
