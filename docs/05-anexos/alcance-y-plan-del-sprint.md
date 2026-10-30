# Alcance y plan del Sprint 01

## Objetivo
Explicar y sustentar MotoYa con el problema de acceso al transporte en motolineal, los requisitos y la arquitectura implementada, siguiendo la organización académica de la docente.

| Entrega | Resultado | Criterio de cierre |
|---|---|---|
| Análisis | Ocho documentos | Actores, historias, requisitos, atributos, restricciones, drivers, decisiones y escenarios coherentes. |
| Arquitectura | Cuatro documentos | Distinguir estilo, enfoque, componentes y estado de implementación. |
| Diseño interno | Módulo de búsqueda, patrones y SOLID | Clases y dependencias reales, con contratos y errores explicados. |
| C4 | Cuatro niveles | Cada vista amplía un elemento identificado en la anterior. |
| Evidencia | Trazabilidad y límites | Separar verificaciones actuales, históricas y pendientes. |
| Tecnología | Boilerplate Dart | Ejecutar un ejemplo aislado con pruebas sin Firebase. |

## Organización
Los documentos de diseño se encuentran en `docs/03-diseno-de-software/diseno-interno/`. Los diagramas editables están en `img/fuentes/`. El ejemplo académico está en `tecnologia/boilerplate-clean-architecture/`.

## Orden de trabajo y definición de terminado
1. Contrastar la implementación con la documentación anterior.
2. Incorporar el recojo en el punto indicado y el problema de vivir lejos de un paradero.
3. Documentar capas y flujos reales sin atribuirles propuestas aún pendientes.
4. Revisar diagramas, enlaces y el ejemplo ejecutable.
5. Publicar un commit por archivo, según instrucción del propietario.

La documentación debe poder recorrerse desde el README hasta el código del ejemplo sin cambiar de tecnologías ni confundir demo con producción. No se inventan reuniones ni aceptación académica. La evaluación corresponde a la docente.

## Siguiente incremento
Obtener rutas de forma independiente en el servidor, sincronizar la vista previa de tarifas con su configuración, verificar despliegue de endpoints y ejecutar pruebas pertinentes en un teléfono real. Reservas financieras y outbox continúan como propuestas hasta su implementación.

[Volver al índice](../../README.md)
