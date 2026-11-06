# Principios de diseño: SOLID


| Principio | Aplicación a MotoYa | Ejemplo para explicar | Comprobación |
|---|---|---|---|
| S: responsabilidad única | UI, coordinación y acceso externo separados | Controller refleja estado; caso de uso coordina; adaptador accede a Firebase. | Revisar las responsabilidades de cada archivo. |
| O: abierto/cerrado | Agregar una implementación del contrato | Nuevo proveedor de rutas detrás de RoutingService. | Puede requerir cambios de composición, sin trasladar SDK al núcleo. |
| L: sustitución | Adaptadores deben mantener significado del contrato | Adaptador de prueba y Firebase entregan los tipos esperados por OfferService. | Probar resultados, errores y cierre de recursos, no solo compilación. |
| I: segregación | Contratos por capacidad | Ubicación, rutas y billetera separados. | Evitar una interfaz única que concentre todo el sistema. |
| D: inversión de dependencias | Aplicación depende de abstracciones | RideSearchUseCase recibe OfferService. | No importar Firebase desde dominio/aplicación. |

Cumplir una regla estática no prueba automáticamente todos los principios SOLID. La revisión debe considerar también el comportamiento y los contratos.

---

[Volver al índice](../../../README.md)
