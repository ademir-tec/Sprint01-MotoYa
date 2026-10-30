# MotoYa: ejemplo de Arquitectura Limpia en Dart

Este boilerplate académico demuestra selección y aceptación de una oferta. Está inspirado en `RideSearchUseCase` y `OfferService` de la app. **Es una simplificación didáctica**, no una copia completa de la app ni de su backend. Sus datos son ficticios.

## Ejecutar

Requiere Dart 3 o posterior. Desde esta carpeta:

```powershell
dart bin/main.dart
dart test/select_offer_check.dart
dart analyze lib bin test
```

No requiere Firebase, Flutter, cuenta, clave ni paquetes externos. Los archivos usan imports relativos y los comandos ejecutan directamente el SDK de Dart. `test/select_offer_check.dart` es una comprobación con salida distinta de cero ante fallo; no utiliza el paquete `test`.

## Capas

| Carpeta | Contenido | Dependencia |
|---|---|---|
| domain | Offer, Assignment, OfferFailure, OfferGateway | Dart y dominio |
| application | SelectOfferUseCase | Dominio |
| data | MemoryOfferGateway | Dominio |
| composition | buildExample | Aplicación y adaptador concreto |
| bin | Entrada de consola | Composición |
| test | Comprobaciones y doble controlado | Contratos y caso de uso |

## Cuatro momentos para explicar

1. Abrir `lib/domain/offer.dart`: modelos sin Flutter ni Firebase.
2. Abrir `lib/domain/offer_gateway.dart`: el núcleo define qué necesita.
3. Abrir `lib/application/select_offer.dart`: coordina usando ese contrato.
4. Abrir `lib/composition/build_example.dart`: selecciona un adaptador. Activar `rejectAcceptance: true` permite demostrar el rechazo sin modificar las reglas del caso de uso.

## Diferencia con la app real

| Ejemplo | App MotoYa |
|---|---|
| OfferGateway: consulta finita | OfferService: stream y negociación |
| SelectOfferUseCase | RideSearchUseCase con estados y recursos |
| Consola | Pantallas y Riverpod |
| Datos en memoria | Servicios Fake y Firebase seleccionados por composición |
| Bloqueo local de doble aceptación | El backend real debe validar asignación con transacciones |

Este ejemplo no demuestra concurrencia distribuida, seguridad financiera, GPS, producción ni pagos. Las pruebas verifican entradas, rechazo, confirmación y doble aceptación local, incluso con respuesta pendiente.

[Volver al entregable](../../README.md)
