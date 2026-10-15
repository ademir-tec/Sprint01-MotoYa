# Alcance y plan del Sprint 01

## Objetivo

Definir una base técnica coherente y trazable para construir MotoYa, relacionando necesidades del usuario, atributos de calidad, decisiones, componentes y diseño interno.

## Entregables documentales

| Trabajo | Resultado | Criterio de cierre |
|---|---|---|
| Contextualizar MotoYa | README y actores | Identifica curso, docente, autor, problema, alcance y límites |
| Analizar el sistema | Historias, requisitos, restricciones y calidad | IDs trazables y criterios observables |
| Diseñar arquitectura | Estilo, enfoque, componentes y ADR | Decisiones justificadas y dependencias claras |
| Diseñar internamente | Módulo Viajes, patrones y SOLID | Reglas aisladas de proveedores y cierre transaccional |
| Comunicar por niveles | Cuatro vistas C4 y secuencia | Contexto, contenedores, componentes y código consistentes |
| Preparar verificación | Datos, estados, reglas y matriz de pruebas | Casos límite y riesgos pendientes explícitos |

## Orden de trabajo

1. Levantar actores, alcance y flujos críticos.
2. Priorizar integridad, seguridad, tiempo real y recuperabilidad.
3. Resolver el diseño base y registrar ambigüedades en ADR.
4. Modelar datos, estados, transacciones y contratos.
5. Revisar navegación, trazabilidad y coherencia del entregable.
6. Publicar los archivos con un commit individual por archivo.

Este orden describe el trabajo del entregable; no inventa fechas de reuniones, aprobación de la docente ni un historial de ejecución del producto.

## Definición de terminado del Sprint 01

La documentación incluye las cuatro áreas de la referencia académica y sus anexos, distingue propuesta de implementación, puede consultarse en GitHub y conserva cambios individuales por archivo. La aceptación académica corresponde a la docente y no se presupone.

## Siguiente incremento propuesto

Implementar primero autenticación, expediente del conductor y políticas de acceso; después cotización y asignación atómica; finalmente cierre con ledger, recargas y SOS. Antes del piloto, ejecutar PV/EQ y resolver las propuestas de ADR-06. La política de privacidad, los requisitos de distribución y la viabilidad operativa del servicio requieren validación específica; este sprint no declara una autorización de operación.

## Glosario

| Término | Significado en MotoYa |
|---|---|
| Solicitud | Pedido todavía sin conductor asignado |
| Oferta | Respuesta de un conductor a una versión del precio del pasajero |
| Viaje | Acuerdo asignado con participantes, precio y estados |
| Comisión | Cargo de MotoYa al conductor al terminar |
| Recarga | Abono al saldo tras revisión humana |
| Ledger | Libro inmutable de movimientos de saldo |
| Reserva | Parte del saldo comprometida para un viaje, todavía sin débito |
| Idempotencia | Repetir una operación sin repetir sus efectos |
| Outbox | Registro durable de eventos pendientes de entrega |
| Driver | Necesidad que condiciona decisiones de arquitectura |
| ADR | Registro de una decisión arquitectónica y sus consecuencias |
