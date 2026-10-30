# Estilo arquitectónico

El estilo principal de MotoYa es **cliente-servidor**. La app móvil y el panel administrativo son clientes que solicitan operaciones al backend. Este se ejecuta mediante **Firebase Cloud Functions**, con infraestructura administrada y ejecución serverless.

![Estilo cliente-servidor de MotoYa: app y panel conectados al backend y servicios administrados](../../img/estilo-arquitectonico-motoya.png)

[Ver imagen completa](../../img/estilo-arquitectonico-motoya.png) · [Versión vectorial ampliable](../../img/estilo-arquitectonico-motoya.svg)

## Cómo funciona

1. El pasajero o conductor utiliza la app; el personal autorizado utiliza el panel web.
2. Los clientes envían solicitudes al backend mediante HTTPS. El servidor valida identidad, permisos y reglas críticas.
3. El backend utiliza Firestore para datos, Storage para archivos y FCM para notificaciones. Mercado Pago es una integración configurable para recargas.
4. El servidor devuelve resultados y los clientes muestran el estado correspondiente.

Las flechas resumen relaciones principales: app y panel también utilizan Firebase Auth y acceden directamente a datos permitidos de Firestore, sujetos a reglas de seguridad. El gráfico no obliga a que todas las lecturas pasen por Cloud Functions.

Actualmente la app consulta el proveedor de rutas y envía los kilómetros; el backend recalcula la tarifa. Obtener la distancia de forma independiente en el servidor sigue pendiente. Las integraciones reales requieren configuración y despliegue; el modo demo puede simularlas.

| Concepto | Elección en MotoYa | Explicación sencilla |
|---|---|---|
| Relación entre sistemas | Cliente-servidor | App y panel solicitan operaciones al backend. |
| Ejecución del backend | Serverless administrado | Firebase ejecuta funciones y administra infraestructura. |
| Microservicios | No se acredita ese estilo | Tener varias funciones no implica servicios autónomos por dominio. |

## Diferencia con el enfoque

**El estilo describe cómo se comunican los sistemas.** El enfoque de **Arquitectura Limpia** describe cómo se organizan sus dependencias internas. Las capas de presentación, aplicación, dominio e infraestructura se explican en [Enfoque arquitectónico](enfoque-arquitectonico.md), junto con el gráfico detallado trasladado a ese documento.

**Para exponer:** «MotoYa utiliza cliente-servidor: la app y el panel son clientes; Cloud Functions es el backend que valida las operaciones y utiliza los servicios Firebase. Su ejecución es serverless porque Firebase administra la infraestructura. La organización interna del código corresponde al enfoque de Arquitectura Limpia».

---

[Volver al índice](../../README.md)
