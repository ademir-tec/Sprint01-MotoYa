# 06. Drivers arquitectónicos

Un driver es una necesidad que condiciona la estructura del sistema. Priorizo seguridad e integridad sobre la comodidad de permitir escrituras directas desde el cliente.

| ID | Driver / evidencia funcional | Decisión que provoca | Costo o tensión | Verificación |
|---|---|---|---|---|
| DA-01 | Dinero consistente: RN-11, RN-18; RF-C09 y RF-S04 | Ledger, transacciones e idempotencia | Mayor complejidad de concurrencia | PV-03, PV-04 |
| DA-02 | Un conductor y pasajero por viaje activo: RN-09 | Asignación atómica y reserva de disponibilidad | Contención al aceptar ofertas | PV-02 |
| DA-03 | Seguimiento y búsqueda rápida: RNF-01, RNF-02 | Geohash y suscripciones limitadas | Consumo de batería, datos y lecturas | EQ-01, EQ-02 |
| DA-04 | Viaje seguro: RN-23, RN-62, RN-63 | PIN, SOS persistente y escalamiento | Requiere atención operativa | PV-05, EQ-06 |
| DA-05 | Conectividad variable: RNF-07 | Estado autoritativo y comandos repetibles | Algunas acciones requieren conexión | EQ-03 |
| DA-06 | Cambio de proveedores y evolución | Clean Architecture y adaptadores | Más contratos y mapeos | EQ-07 |
| DA-07 | Protección de documentos y panel: RNF-10, RNF-11 | Roles, segundo factor y almacenamiento privado | Administración de permisos | EQ-04 |
| DA-08 | Operación inicial pequeña con crecimiento: RNF-09 | Backend modular sobre servicios administrados | Dependencia y costo por uso | EQ-05 |

La trazabilidad completa de estos drivers se encuentra en el anexo de validación. El término modular describe los límites del código; no implica desplegar un microservicio por cada entidad.
