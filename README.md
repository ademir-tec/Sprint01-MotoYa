# MotoYa | Sprint 01
## Documentación técnica del proyecto

**Universidad Nacional de San Cristóbal de Huamanga**  
Facultad de Ingeniería de Minas, Geología y Civil  
Escuela Profesional de Ingeniería de Sistemas

| Dato | Información |
|---|---|
| Curso | Arquitectura de Software |
| Docente | Ing. Lizbeth Jaico Quispe |
| Estudiante | Ayala Arango, Alvaro Ademir |
| Proyecto | MotoYa: transporte en moto lineal en Huamanga, Ayacucho |
| Entregable | Sprint 01: documentación técnica del proyecto |
| Versión examinada | App 1.0.9+10 |
| Fecha de actualización | 30 de octubre de 2026 |
| Estado del documento | Documentación actualizada según la implementación local examinada |

## Presentación

MotoYa nace de una necesidad identificada en Ayacucho: contar con una aplicación que facilite solicitar transporte en motolineal con herramientas de seguridad y recojo en el punto indicado por el pasajero. Esta necesidad es especialmente relevante para quienes viven lejos de los paraderos de motos y deben caminar o buscar una unidad antes de iniciar su viaje.

Con MotoYa, el pasajero puede pedir una moto desde su vivienda u otro punto de recojo, indicar el destino, negociar el precio y conocer al conductor asignado. Mientras la moto se dirige al lugar acordado, puede terminar de prepararse o realizar sus actividades, consultando el tiempo estimado de llegada para estar listo al recojo. El conductor recibe solicitudes y se dirige hacia el pasajero. Un panel separado permite revisar registros, recargas y casos de soporte.

La solución utiliza Flutter en la app y el panel, y Firebase como plataforma del backend. Su organización interna sigue Arquitectura Limpia: separa las reglas y contratos de las pantallas y de las tecnologías externas.

Este repositorio organiza la documentación técnica siguiendo la estructura de la [guía académica de la docente](https://github.com/devlizbethjaico/Marketplace-arquitSoft-02). Los identificadores de actores, historias y requisitos se conservan del entregable previo cuando corresponden; las adiciones se identifican explícitamente.

## Problema y solución

| Aspecto | Descripción |
|---|---|
| Problema central | El diagnóstico inicial del proyecto identifica en Ayacucho la falta de una aplicación orientada a solicitar transporte en motolineal con herramientas de seguridad y recojo en el punto indicado por el pasajero. |
| Dificultad de acceso | Quienes viven lejos de un paradero deben desplazarse para buscar una moto, sin conocer previamente su disponibilidad ni el tiempo que tardarán en conseguirla. |
| Necesidad del pasajero | Solicitar una moto desde donde se encuentra, conocer al conductor, acordar el precio y consultar su llegada sin ir primero al paradero. |
| Necesidad del conductor | Encontrar pasajeros cercanos y conocer condiciones y tarifa de cada solicitud. |
| Solución | Una app que conecta al pasajero con conductores para realizar el recojo en el punto acordado, con negociación, identificación del conductor, mapa, PIN, seguimiento y herramientas de ayuda. |
| Propuesta de valor | «Pide tu moto desde donde estés y aprovecha tu tiempo mientras llega a recogerte». El tiempo estimado permite prepararse para estar listo al arribo. |
| Seguridad del servicio | Apoyar un viaje más seguro mediante revisión de conductores, datos de identificación, PIN de inicio, seguimiento, compartir viaje y SOS. Estas herramientas ayudan a reducir riesgos, sin prometer eliminarlos. |
| Gestión | Panel web para conductores, recargas, usuarios, atención, tarifas y finanzas según permisos. |
| Cobro del viaje | El pasajero paga directamente al conductor mediante efectivo, Yape o Plin. |
| Ingreso de MotoYa | Comisión del conductor registrada al finalizar el viaje en el flujo real del servidor; las demostraciones simulan esta operación. |

## Objetivo y alcance

**Objetivo general del proyecto:** facilitar el acceso al transporte en motolineal en Huamanga, Ayacucho, mediante una aplicación que permita solicitar recojo en el punto indicado, aprovechar mejor el tiempo previo al viaje y disponer de herramientas de seguridad.

| Objetivo específico | Aporte esperado |
|---|---|
| Acercar el transporte al pasajero | Reducir la necesidad de caminar hasta un paradero para buscar una unidad. |
| Mejorar la coordinación del recojo | Mostrar ubicación y llegada estimada para que el pasajero se prepare mientras el conductor se aproxima. |
| Apoyar la seguridad | Identificar al conductor y utilizar PIN, seguimiento y herramientas de ayuda. |
| Transparentar el acuerdo | Permitir conocer y negociar el precio antes de iniciar el viaje. |
| Facilitar oportunidades al conductor | Conectar solicitudes de pasajeros con conductores disponibles. |

El objetivo del Sprint 01 es explicar y sustentar la arquitectura de MotoYa mediante requisitos, decisiones, diseño interno, cuatro vistas C4 y evidencia del código existente.

El recojo corresponde a una solicitud inmediata desde un punto acordado. La posibilidad de terminar de prepararse durante la llegada no implica programar viajes futuros ni añadir espera gratuita: el pasajero debe estar listo cuando llegue la moto.

| Incluido | Fuera del alcance de esta entrega |
|---|---|
| Cuenta, perfil y modos de usuario | Afirmar que todas las funciones están publicadas |
| Solicitud, ofertas, viaje y seguridad | Garantizar operación comercial o disponibilidad productiva |
| Conductores, saldo y recargas | Procesar pagos reales durante una exposición |
| App, panel y backend implementados localmente | Migrar MotoYa a Angular, Express o PostgreSQL |
| Separación de capas y pruebas reproducibles | Implementar automáticamente toda mejora propuesta en el diseño previo |

## Cómo interpretar el estado

| Estado | Significado |
|---|---|
| Implementado en código | Existe una implementación local identificable. No acredita publicación ni validación de todos los casos. |
| Demo | El flujo utiliza datos o adaptadores simulados. |
| Verificado ahora | Se ejecutó una comprobación durante esta revisión y se indica su alcance. |
| Evidencia histórica | Se informó una prueba anterior; no se volvió a ejecutar en esta revisión. |
| Pendiente | Falta implementación, integración, despliegue o verificación específica. |


## Índice del entregable

| Bloque | Documento |
|---|---|
| 1.1 | [Actores](docs/01-analisis-de-sistema/01-actores.md) |
| 1.2 | [Historias de usuario](docs/01-analisis-de-sistema/02-historias-del-usuario.md) |
| 1.3 | [Requisitos funcionales](docs/01-analisis-de-sistema/03-requisitos-funcionales.md) |
| 1.4 | [Atributos de calidad](docs/01-analisis-de-sistema/04-atributos-de-calidad.md) |
| 1.5 | [Restricciones](docs/01-analisis-de-sistema/05-restricciones.md) |
| 1.6 | [Drivers arquitectónicos](docs/01-analisis-de-sistema/06-drivers-arquitectonicos.md) |
| 1.7 | [Decisiones arquitectónicas](docs/01-analisis-de-sistema/07-decisiones-arquitectonicas.md) |
| 1.8 | [Escenarios de calidad](docs/01-analisis-de-sistema/08-escenarios-atributos-calidad.md) |
| 2.1 | [Arquitectura inicial y evolución](docs/02-arquitectura-software/arquitectura-inicial.md) |
| 2.2 | [Estilo arquitectónico](docs/02-arquitectura-software/estilo-arquitectonico.md) |
| 2.3 | [Enfoque arquitectónico: Arquitectura Limpia](docs/02-arquitectura-software/enfoque-arquitectonico.md) |
| 2.4 | [Componentes arquitectónicos](docs/02-arquitectura-software/componentes-arquitectonicos.md) |
| 3.1 | [Diseño interno: búsqueda y negociación](docs/03-diseno-de-software/diseno-interno/diseno-interno-de-modulos.md) |
| 3.2 | [Patrones de diseño](docs/03-diseno-de-software/diseno-interno/patrones-de-diseno.md) |
| 3.3 | [Principios de diseño: SOLID](docs/03-diseno-de-software/diseno-interno/principios-de-diseno.md) |
| 4.1 | [Nivel 1: contexto del sistema](docs/04-modelo-c4/nivel1-contexto.md) |
| 4.2 | [Nivel 2: contenedores](docs/04-modelo-c4/nivel2-contenedores.md) |
| 4.3 | [Nivel 3: componentes de la app](docs/04-modelo-c4/nivel3-componentes.md) |
| 4.4 | [Nivel 4: código de búsqueda y ofertas](docs/04-modelo-c4/nivel4-codigo.md) |
| 5.1 | [Modelo de datos existente](docs/05-anexos/modelo-de-datos-y-estados.md) |
| 5.2 | [Reglas de negocio relevantes](docs/05-anexos/reglas-de-negocio.md) |
| 5.3 | [Límites de confianza y deuda pendiente](docs/05-anexos/limites-y-pendientes.md) |
| 5.4 | [Trazabilidad y validación](docs/05-anexos/trazabilidad-y-validacion.md) |
| 5.7 | [Guía breve para exponer](docs/05-anexos/guia-de-exposicion.md) |
| Anexo | [Alcance y plan del sprint](docs/05-anexos/alcance-y-plan-del-sprint.md) |
| Tecnología | [Ejemplo ejecutable de Arquitectura Limpia en Dart](tecnologia/boilerplate-clean-architecture/README.md) |
| Diagrama | [Esquema interactivo de las capas](img/arquitectura-limpia.html) |

## Diagrama general de MotoYa

![Diagrama general de MotoYa: app, panel, backend y servicios Firebase](img/arquitectura-general-motoya.png)

La app y el panel solicitan operaciones al backend en Cloud Functions. Firebase Auth identifica al usuario; Cloud Firestore almacena documentos y Cloud Storage conserva archivos. FCM permite enviar notificaciones. Los mapas y las rutas utilizan proveedores cartográficos, y Mercado Pago es una integración configurable para recargas.

El esquema resume las relaciones principales. También existen accesos directos permitidos a Firestore, sujetos a sus reglas de seguridad. Las integraciones dependen de la configuración y el despliegue; la demostración puede utilizar servicios simulados. Actualmente el servidor todavía recibe los kilómetros calculados por el celular.

[Abrir la imagen en tamaño completo](img/arquitectura-general-motoya.png).

## Publicación y datos

La documentación describe código examinado localmente, servicios de demostración y pendientes. Este repositorio no acredita un despliegue productivo. El ejemplo de tecnología es didáctico y no es la app completa. No contiene claves, expedientes ni datos privados.
