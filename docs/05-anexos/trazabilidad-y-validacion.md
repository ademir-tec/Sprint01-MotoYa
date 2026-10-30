# Trazabilidad y validación


| Necesidad | Evidencia en la implementación | Verificación |
|---|---|---|
| Dominio independiente | app/lib/domain y application | tool/check_architecture.py |
| Buscar y aceptar | RideSearchUseCase y OfferService | app/tool/clean_usecase_check.dart |
| Estado de interfaz | RideSearchController | Pruebas Flutter del flujo. |
| Servicios intercambiables | offerServiceProvider | Revisar selección de Fake/Firebase y contrato común. |
| Sesión y comandos del panel | PanelOperations, sesiones y contratos | admin/tool/clean_usecase_check.dart |
| Integridad del backend | application/trips.ts y puertos | Pruebas unitarias, reglas y concurrencia. |
| GPS apagado | Control de ubicación y disponibilidad | Escenario EQ-10 en emulador y dispositivo. |

**Resultado ejecutado en esta revisión:** el comprobador estático aprobó **239 bibliotecas** y no reportó dependencias de frameworks en dominio/aplicación ni imports de UI hacia Firebase/data, según sus reglas. No se ejecutó en esta revisión toda la suite Flutter, backend, carga ni restauración.

```powershell
python tool/check_architecture.py
dart --packages=app/.dart_tool/package_config.json app/tool/clean_usecase_check.dart
dart --packages=admin/.dart_tool/package_config.json admin/tool/clean_usecase_check.dart
```

Los dos últimos comandos quedan documentados para reproducir pruebas específicas; no se presentan como ejecutados ahora. Requieren el entorno y las dependencias del proyecto.

---

[Volver al índice](../../README.md)

## Verificación del ejemplo publicado

El 30/10/2026 se ejecutaron en `tecnologia/boilerplate-clean-architecture/`:

| Comando | Resultado | Alcance |
|---|---|---|
| `dart bin/main.dart` | Aprobado | Búsqueda y confirmación con datos ficticios. |
| `dart test/select_offer_check.dart` | Aprobado | Entradas inválidas, oferta inexistente, confirmación, rechazo y doble aceptación local. |
| `dart analyze lib bin test` | Sin problemas detectados | Análisis estático del ejemplo. |

Estos resultados corresponden al ejemplo académico; no son resultados de producción ni reemplazan las pruebas de la app completa.
