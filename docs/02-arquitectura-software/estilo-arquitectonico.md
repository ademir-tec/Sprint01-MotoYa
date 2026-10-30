# Estilo arquitectónico

![Estilo arquitectónico de MotoYa: clientes Flutter, capas del backend y servicios externos](../../img/estilo-arquitectonico-motoya.png)

[Ver imagen completa](../../img/estilo-arquitectonico-motoya.png) · [Versión vectorial ampliable](../../img/estilo-arquitectonico-motoya.svg)

MotoYa utiliza **cliente-servidor**: la app móvil y el panel web se comunican con el backend. El backend utiliza **Cloud Functions**, con infraestructura administrada por Firebase. Su código sigue el enfoque de **Arquitectura Limpia**, con presentación, aplicación, dominio e infraestructura.

Las columnas del gráfico agrupan responsabilidades para explicarlas; los archivos indicados existen en las carpetas correspondientes del backend. Las flechas hacia el dominio muestran el uso de las reglas internas. La infraestructura implementa los contratos de `application/ports.ts`, de modo que el dominio no necesita conocer Firebase.

**Para exponer:** «Arriba están los usuarios y sus interfaces. En el centro, el backend recibe las solicitudes, coordina los casos de uso y aplica las reglas del negocio. La infraestructura conecta esas reglas con Firebase y otros servicios. Firestore guarda documentos; Storage guarda archivos; Auth identifica al usuario y FCM permite enviar notificaciones».


| Concepto | Elección en MotoYa | Explicación sencilla |
|---|---|---|
| Relación entre sistemas | Cliente-servidor | App y panel solicitan operaciones al backend. |
| Ejecución del backend | Serverless administrado | Firebase ejecuta funciones y administra infraestructura. |
| Organización del código | Capas y agrupaciones funcionales | Cada archivo tiene una responsabilidad y límites de dependencia. |
| Microservicios | No se acredita ese estilo | Tener varias funciones no implica servicios autónomos por dominio. |

---

[Volver al índice](../../README.md)
