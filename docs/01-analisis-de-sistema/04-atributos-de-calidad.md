# Atributos de calidad


| Atributo | Necesidad | Respuesta arquitectónica | Cómo verificar |
|---|---|---|---|
| Mantenibilidad | Cambiar un proveedor sin alterar reglas | Contratos internos y adaptadores | Revisar imports y sustituir un adaptador en pruebas. |
| Seguridad | Proteger saldo, permisos y documentos | Autorización del servidor y reglas de acceso | Pruebas negativas con usuarios y roles distintos. |
| Integridad | Evitar dobles asignaciones o comisiones | Transacciones y validación de estados | Ejecutar pruebas de concurrencia y reintentos. |
| Usabilidad | Entender solicitud y viaje | Una acción principal y mensajes claros | Recorrido de pasajero y conductor en teléfono. |
| Recuperación | Continuar después de una falla | Estado persistente en flujo real y recuperación de sesión | Cortar conexión y comprobar resincronización. |
| Rendimiento | Responder sin demoras excesivas | Consultas acotadas y suscripciones | Medir tiempos reales; no inferirlos por usar Firebase. |
| Testabilidad | Probar negocio sin interfaz ni nube | Casos de uso independientes y dobles de servicios | Ejecutar herramientas Dart y comprobador de arquitectura. |

---

[Volver al índice](../../README.md)
