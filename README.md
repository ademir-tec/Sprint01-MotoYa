# MotoYa | Entregable Sprint 01
## Documentación técnica del proyecto

**Universidad Nacional de San Cristóbal de Huamanga**  
Facultad de Ingeniería de Minas, Geología y Civil  
Escuela Profesional de Ingeniería de Sistemas

| Dato | Información |
|---|---|
| Curso | Arquitectura de Software |
| Docente | Ing. **LIZBETH JAICO QUISPE** |
| Estudiante | Ayala Arango, Alvaro Ademir |
| Proyecto | MotoYa: aplicación de moto lineal como taxi para Huamanga, Ayacucho |
| Entregable | Sprint 01 - Documentación técnica del proyecto |
| Versión y fecha | 1.0 · 15 de octubre de 2026 |

## Presentación

En este entregable desarrollo el análisis y la arquitectura propuesta de MotoYa. El proyecto busca conectar a pasajeros con conductores verificados, permitir la negociación de la tarifa y registrar el viaje con herramientas de seguridad. Organizo el diseño mediante requisitos trazables, decisiones arquitectónicas, separación por capas y las cuatro vistas del modelo C4.

El pasajero paga directamente al conductor en efectivo, Yape o Plin. MotoYa descuenta una comisión del saldo prepagado del conductor al finalizar el viaje. La app tendrá modos pasajero y conductor sobre una sola cuenta; el personal operará desde un panel web separado.

## Lectura del entregable

| Bloque | Documentos |
|---|---|
| Análisis del sistema | [Actores](docs/01-analisis-de-sistema/01-actores.md), [historias de usuario](docs/01-analisis-de-sistema/02-historias-del-usuario.md), [requisitos funcionales](docs/01-analisis-de-sistema/03-requisitos-funcionales.md), [atributos de calidad](docs/01-analisis-de-sistema/04-atributos-de-calidad.md) |
| Fundamentos de arquitectura | [Restricciones](docs/01-analisis-de-sistema/05-restricciones.md), [drivers](docs/01-analisis-de-sistema/06-drivers-arquitectonicos.md), [decisiones](docs/01-analisis-de-sistema/07-decisiones-arquitectonicas.md), [escenarios de calidad](docs/01-analisis-de-sistema/08-escenarios-atributos-calidad.md) |
| Arquitectura de software | [Arquitectura inicial](docs/02-arquitectura-software/arquitectura-inicial.md), [estilo](docs/02-arquitectura-software/estilo-arquitectonico.md), [enfoque](docs/02-arquitectura-software/enfoque-arquitectonico.md), [componentes](docs/02-arquitectura-software/componentes-arquitectonicos.md) |
| Diseño de software | [Diseño interno](docs/03-diseno-de-software/diseno-interno-de-modulos.md), [patrones](docs/03-diseno-de-software/patrones-de-diseno.md), [principios SOLID](docs/03-diseno-de-software/principios-de-diseno.md) |
| Modelo C4 | [Nivel 1: contexto](docs/04-modelo-c4/nivel1-contexto.md), [nivel 2: contenedores](docs/04-modelo-c4/nivel2-contenedores.md), [nivel 3: componentes](docs/04-modelo-c4/nivel3-componentes.md), [nivel 4: código](docs/04-modelo-c4/nivel4-codigo.md) |
| Anexos técnicos | [Datos y estados](docs/05-anexos/modelo-de-datos-y-estados.md), [reglas de negocio](docs/05-anexos/reglas-de-negocio.md), [trazabilidad y validación](docs/05-anexos/trazabilidad-y-validacion.md), [alcance del sprint](docs/05-anexos/alcance-y-plan-del-sprint.md), [referencias](docs/05-anexos/referencias.md) |

## Alcance y estado

La zona inicial comprende Ayacucho, Carmen Alto, San Juan Bautista, Jesús Nazareno y Andrés Avelino Cáceres. El MVP contempla solicitud, negociación, verificación de conductores, seguimiento, PIN, SOS, saldo, recargas y soporte. Quedan fuera pagos integrados, reparto de paquetes, mototaxis de tres ruedas, otras ciudades e iOS en la primera fase.

Este repositorio entrega **diseño técnico**, no una aplicación desplegada. El antecedente del proyecto es un prototipo móvil con simulaciones; aquí no se certifican pruebas de ese código ni servicios productivos. Las metas de rendimiento y los contratos se presentan para implementar y validar en los siguientes sprints. Los diagramas Mermaid se visualizan directamente en GitHub.
