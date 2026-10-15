# Principios de diseño: SOLID

| Principio | Aplicación concreta | Violación que se evita | Evidencia a exigir al implementar |
|---|---|---|---|
| S: responsabilidad única | Handler traduce, caso de uso coordina, Viaje valida estado y adaptador persiste | Widget que calcula comisión, actualiza saldo y envía SMS | Cambiar mensaje visual no modifica lógica monetaria |
| O: abierto/cerrado | Nuevos proveedores implementan RutaPort | Condicionales por proveedor en pantallas | Nuevo adaptador y composición sin alterar CotizarViaje |
| L: sustitución | Google y respaldo entregan mismas unidades y semántica de fallo | Un adaptador devuelve kilómetros y otro metros | Suite común: ruta válida, sin ruta, timeout y datos incompletos |
| I: segregación | RutaPort, NotificacionPort y CierreViajePort separados | Interfaz gigante que obliga a implementar operaciones ajenas | Cada caso de uso conoce solo las capacidades necesarias |
| D: inversión | FinalizarViaje depende de CierreViajePort | Instanciar Firestore dentro del dominio | Inyección desde viajes.module y prueba con doble en memoria |

## Otros criterios

**Alta cohesión:** reglas de espera y estados pertenecen a Viajes; validación documental a Conductores. **Bajo acoplamiento:** se usan contratos públicos entre módulos. **DRY:** una política versionada produce la comisión; no hay fórmulas distintas en móvil, panel y servidor. **KISS:** se empieza con módulos y servicios administrados. **YAGNI:** no se construye una pasarela cuando el pago es externo.

## Revisión de dependencias

1. Revisar que dominio no importe SDKs ni elementos de interfaz.
2. Verificar que aplicación reciba puertos por inyección.
3. Comprobar que presentación no escriba directamente en el ledger.
4. Confirmar que dobles de prueba y adaptadores reales mantengan unidades, errores y postcondiciones.
5. Verificar que un rechazo de negocio deje el estado sin cambios.

La responsabilidad única no exige una transacción por entidad: el cierre debe coordinar varias escrituras porque su invariancia es conjunta.
