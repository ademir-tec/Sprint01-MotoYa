# Componentes arquitectónicos

| Componente | Responsabilidad | Datos propios | Interfaz de colaboración |
|---|---|---|---|
| Identidad | Cuenta, modos, estado y acceso al panel | Usuario, cuentaPanel, alias | AutorizarActor, CambiarModo |
| Conductores | Expediente, moto y revisión documental | Conductor, moto, documento, modificación | RevisarRegistro, ConsultarElegibilidad |
| Geolocalización | Rutas, direcciones, cobertura y candidatos geográficos | Cotización y posición operativa | CalcularRuta, BuscarCandidatos |
| Tarifas | Cotización y políticas versionadas | Configuración tarifaria | Cotizar, CalcularComision |
| Despacho | Solicitud, negociación y asignación | Solicitud, oferta, bloqueos activos | CrearSolicitud, EnviarOferta, AceptarOferta |
| Viajes | Llegada, PIN, espera, estados y finalización | Viaje, eventos, recorrido | MarcarLlegada, IniciarViaje, FinalizarViaje |
| Billetera | Reserva, recarga, débito y ajuste | Reserva, movimiento, recarga, saldo derivado | ReservarComision, CerrarConComision, ConfirmarRecarga |
| Seguridad | SOS, anomalías, sanciones y apelaciones | Alerta, caso, sanción, lista de bloqueo | ActivarSOS, TomarAlerta, AplicarSancion |
| Comunicación | Chat y entrega de avisos | Mensaje, outbox, estado de entrega | EnviarMensaje, PublicarNotificacion |
| Administración y reportes | Parámetros, auditoría y vistas agregadas | Auditoría, gasto, reporte | CambiarConfiguracion, ConsultarFinanzas |

## Contratos e invariantes compartidos

Los identificadores se intercambian como referencias; ningún módulo modifica internamente las entidades de otro mediante una pantalla. Las operaciones que cruzan Viajes y Billetera utilizan un puerto transaccional definido para el caso de uso. Los reportes consumen proyecciones; no reescriben el ledger.

`saldoContable = suma(movimientos confirmados)` y `saldoDisponible = saldoContable - reservas activas`. Una reserva evita gastar dos veces la capacidad de pagar comisión; no es un débito anticipado. Los ajustes negativos deben respetar reservas activas. Cancelar libera la reserva; finalizar la convierte en un único débito.

## Errores de dominio

| Código | Significado | Conducta del cliente |
|---|---|---|
| NO_AUTORIZADO | Actor sin permiso | Informar y no reintentar automáticamente |
| OFERTA_VENCIDA | Tiempo agotado según servidor | Refrescar ofertas |
| CONFLICTO_ASIGNACION | Pasajero o conductor ya ocupado | Recuperar estado actual |
| SALDO_INSUFICIENTE | Disponible menor a comisión | Solicitar recarga |
| ESTADO_INVALIDO | Transición no admitida | Releer viaje |
| RUTA_NO_DISPONIBLE | No hay cotización confiable | Mantener selección y permitir reintento |
| OPERACION_REPETIDA | Existe resultado de la misma clave | Devolver el resultado persistido |
