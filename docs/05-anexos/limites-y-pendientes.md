# Límites de confianza y deuda pendiente


| Tema | Situación observada | Trabajo pendiente |
|---|---|---|
| Distancia de tarifa | createRideRequestFor recibe km y comprueba límites geométricos | Obtener ruta independientemente en servidor. |
| Vista previa | FareRules usa constantes locales | Sincronizar política para evitar diferencias con configuración real. |
| Seguridad del APK | Un cliente modificado puede enviar entradas manipuladas | Fortalecer validación en servidor; Arquitectura Limpia no lo resuelve sola. |
| Despliegue | Código local y demo no acreditan funciones publicadas | Inventariar y verificar producción antes de activarla. |
| Eliminación de cuenta | Existe código, con antecedentes de endpoint no disponible | Verificar despliegue y flujo real antes de darlo por resuelto. |
| Recargas integradas | Mercado Pago está contemplado en código | Configuración, habilitación y pruebas específicas. |
| Concurrencia y recuperación | Hay pruebas y mecanismos en el proyecto | Reejecutar suites pertinentes para afirmar resultados actuales. |

---

[Volver al índice](../../README.md)
