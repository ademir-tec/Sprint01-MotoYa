# 01. Actores y permisos

MotoYa diferencia identidad, modo de uso y autorización. Una persona conserva el mismo `usuarioId` al cambiar de modo. La aprobación del perfil conductor no crea una segunda cuenta.

| Actor | Objetivo | Operaciones | Límite |
|---|---|---|---|
| Pasajero | Encontrar transporte y viajar con seguridad | Solicitar, negociar, elegir conductor, compartir, SOS y calificar | Solo sus solicitudes y viajes |
| Conductor | Recibir viajes y administrar su saldo | Registrar documentos, conectarse, ofertar, conducir, recargar | Registro aprobado, documentos vigentes y saldo suficiente salvo promoción |
| Agente de soporte | Resolver la operación cotidiana | Revisar registros y recargas, atender SOS y reclamos | Suspensiones de hasta 3 días; consulta sensible vinculada a caso |
| Administrador | Supervisar la operación | Gestionar agentes, zonas, sanciones y ajustes | Suspensiones de hasta 30 días; ajustes de hasta S/ 50 |
| Dueño | Administrar el negocio | Tarifas, comisión, administradores, finanzas y sanciones permanentes | Toda acción sensible exige motivo, segundo factor y auditoría |
| Contador, opcional | Revisar información financiera | Consultar y exportar reportes agregados | Sin modificación ni acceso a documentos o ubicaciones |
| Servicio de mapas | Obtener direcciones, ruta y distancia | Google Maps Platform; respaldo propuesto GraphHopper/Photon | No decide precios ni permisos |
| Autenticación y mensajería | Verificar cuentas y transmitir avisos | Firebase Auth, FCM y proveedor SMS | No sustituye el registro persistente del viaje o del SOS |

## Reglas de autorización

- El usuario no cambia de modo con solicitud o viaje activo; al pasar a pasajero se desconecta como conductor.
- Una sanción se aplica a la cuenta y afecta ambos modos.
- El cliente no puede modificar saldo, aprobación, comisión, sanciones ni estados críticos por escritura directa.
- El panel tiene cuentas independientes; no existe registro público de personal.
- El chat se consulta por soporte solo con un reclamo o SOS asociado. La lectura de datos sensibles queda auditada.
- Para resolver la ambigüedad de permisos de configuración, propongo reservar tarifa y comisión al dueño; el administrador gestiona parámetros operativos. Véase ADR-06.

Los roles se comprueban en el servidor en cada comando. Ocultar controles en la interfaz solo mejora la experiencia; no concede ni revoca permisos.
