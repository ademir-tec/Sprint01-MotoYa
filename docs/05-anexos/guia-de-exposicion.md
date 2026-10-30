# Guía breve para exponer


| Momento | Qué mostrar | Cómo explicarlo |
|---|---|---|
| Problema | Presentación y actores | «En Ayacucho identificamos la necesidad de pedir una motolineal con herramientas de seguridad. Si vives lejos del paradero, buscar una moto te toma tiempo. Con MotoYa la pides desde donde estás y viene a recogerte mientras terminas de prepararte». |
| Estilo | Arquitectura general | «La app y el panel son clientes. El backend real valida las operaciones críticas». |
| Enfoque | Cuadro de capas | «Arquitectura Limpia organiza las dependencias hacia las reglas internas». |
| Dominio | OfferService | «Aquí se define qué necesita la búsqueda, sin indicar cómo se conecta a Firebase». |
| Aplicación | RideSearchUseCase | «Este caso de uso coordina búsqueda, ofertas y confirmación». |
| Datos | FakeOfferService y FirebaseOfferService | «Ambos cumplen el contrato, pero uno simula y el otro se comunica con servicios reales». |
| Composición | offerServiceProvider | «Aquí se elige qué implementación utilizar». |
| C4 | Contexto hasta código | «Cada vista amplía una parte de la anterior». |
| Evidencia | Comprobación de arquitectura | «239 bibliotecas pasaron las reglas estáticas examinadas; las pruebas funcionales son otra verificación». |
| Límites | Tabla de pendientes | «El backend todavía recibe kilómetros del cliente; es una mejora pendiente y no una garantía resuelta». |

---

[Volver al índice](../../README.md)
