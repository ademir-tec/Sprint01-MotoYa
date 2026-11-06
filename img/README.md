# Diagramas de MotoYa

| Diagrama | Qué explica | Documento |
|---|---|---|
| [Estilo cliente-servidor](estilo-cliente-servidor-motoya.png) · [SVG](estilo-cliente-servidor-motoya.svg) | Comunicación entre app, panel, backend y servicios. | [Estilo arquitectónico](../docs/02-arquitectura-software/estilo-arquitectonico.md) |
| [Enfoque de Arquitectura Limpia](enfoque-arquitectonico-motoya.png) · [SVG](enfoque-arquitectonico-motoya.svg) | Capas, responsabilidades y dependencias internas. | [Enfoque arquitectónico](../docs/02-arquitectura-software/enfoque-arquitectonico.md) |
| [Dependencias de la app](arquitectura-limpia.png) | Contratos y adaptadores de la app móvil. | [Enfoque arquitectónico](../docs/02-arquitectura-software/enfoque-arquitectonico.md) |

Los cuatro niveles C4 se visualizan como Mermaid en sus documentos. Sus fuentes están en `fuentes/`.

`arquitectura-limpia.html` es un visor autónomo generado con Archify para las dependencias principales de la app. Descarga el archivo y ábrelo en el navegador para interactuar. No confundir los colores de categorías del visor con un inventario de tecnologías: el diagrama representa capas lógicas.

El contenido del visor es español y sus controles fijos utilizan inglés. Las flechas representan dependencias de código; los adaptadores de pruebas y operación cumplen los contratos del núcleo.

[Volver al índice](../README.md)
