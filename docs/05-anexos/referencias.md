# Referencias técnicas

## Referencia académica de organización

Jaico Quispe, Lizbeth. [Marketplace-arquitSoft-02](https://github.com/devlizbethjaico/Marketplace-arquitSoft-02). Repositorio consultado el 15 de octubre de 2026, revisión `bf0dd8ddb9affd43d60bd9578f08c25c3e83ec69`.

Se adopta como guía la organización en análisis del sistema, arquitectura de software, diseño interno y modelo C4. El dominio, los actores, las reglas, los diagramas y las decisiones de esta entrega se desarrollan para MotoYa. No se incorpora el boilerplate de comercio electrónico ni se trasladan sus pasarelas de pago al proyecto.

## Documentación técnica consultada

- [Modelo C4: diagramas](https://c4model.com/diagrams). Guía para separar contexto, contenedores, componentes y código; las vistas de MotoYa se expresan mediante Mermaid.
- [Cloud Firestore: transacciones y escrituras por lotes](https://firebase.google.com/docs/firestore/manage-data/transactions). Referencia para diseñar operaciones atómicas y considerar reejecución por concurrencia.
- [Cloud Functions: reintentos de funciones asíncronas](https://firebase.google.com/docs/functions/retries). Referencia para diseñar consumidores idempotentes y entrega con reintentos.

Consulta técnica: 15 de octubre de 2026. Los contratos, políticas de reserva, límites y decisiones de negocio de esta entrega son propuestas del proyecto; las referencias de proveedor no los convierten en funcionalidades implementadas ni en garantías de operación.
