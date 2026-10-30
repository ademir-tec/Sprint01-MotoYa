# Diagramas de MotoYa

| Diagrama | Qué explica | Documento |
|---|---|---|
| [Estilo cliente-servidor](estilo-arquitectonico-motoya.png) · [SVG](estilo-arquitectonico-motoya.svg) | Comunicación entre app, panel, backend y servicios. | [Estilo arquitectónico](../docs/02-arquitectura-software/estilo-arquitectonico.md) |
| [Enfoque de Arquitectura Limpia](enfoque-arquitectonico-motoya.png) · [SVG](enfoque-arquitectonico-motoya.svg) | Capas, responsabilidades y dependencias internas. | [Enfoque arquitectónico](../docs/02-arquitectura-software/enfoque-arquitectonico.md) |
| [Dependencias de la app](arquitectura-limpia.png) | Contratos y adaptadores de la app móvil. | [Enfoque arquitectónico](../docs/02-arquitectura-software/enfoque-arquitectonico.md) |

Los cuatro niveles C4 se visualizan como Mermaid en sus documentos. Sus fuentes están en `fuentes/`.

`arquitectura-limpia.html` es un visor autónomo generado con Archify para las dependencias principales de la app. Descarga el archivo y ábrelo en el navegador para interactuar. No confundir los colores de categorías del visor con un inventario de tecnologías: el diagrama representa capas lógicas.

El visor pasó nueve controles de composición sin errores ni advertencias. Se verificó automáticamente en navegador y se inspeccionó una captura de 1440 × 900. El contenido es español y los controles fijos del visor son inglés. Este resultado valida la presentación del artefacto, no la seguridad o el funcionamiento de toda la app.

[Volver al índice](../README.md)
