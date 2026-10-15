# 08. Escenarios de atributos de calidad

Cada escenario identifica fuente, estímulo, entorno, artefacto, respuesta y medida. Los percentiles y plazos adicionales son criterios propuestos para el piloto. Todos están **pendientes de ejecución**.

| ID / atributo | Fuente y estímulo | Entorno / artefacto | Respuesta | Medida y verificación |
|---|---|---|---|---|
| EQ-01 Rendimiento | Pasajero confirma Buscar moto | Red estable; Despacho y app conductor | Filtrar y entregar solicitud elegible | RNF-01: menor a 3 s; medir p95 extremo a extremo en 1,000 solicitudes y reportar también máximo y errores |
| EQ-02 Frescura | Conductor transmite GPS | 300 viajes activos; localización | Publicar posición y su antigüedad | Captura cada 3-5 s; propuesta p95 de edad menor a 10 s en red estable; medir reloj servidor y visualización |
| EQ-03 Recuperación | Red móvil cae 60 s y vuelve | Viaje activo; app y Viajes | Mantener el viaje, releer estado y repetir comando con misma clave | Cero viajes perdidos y cero cargos duplicados; propuesta de resincronización menor a 10 s tras recuperar red |
| EQ-04 Seguridad | Pasajero intenta consultar DNI ajeno o modificar saldo | Sesión válida sin privilegio; reglas y funciones | Denegar sin mutación ni datos expuestos | 100% de casos negativos definidos rechazados; incluir SDK directo y comandos del servidor |
| EQ-05 Escalabilidad | Carga crece a 2,000 conductores y 300 viajes | Entorno de prueba aislado; backend | Procesar estados y ubicación sin duplicidad | Mantener EQ-01/EQ-02; propuesta menos de 1% de errores técnicos; registrar límites, consumo y contención |
| EQ-06 Seguridad del viaje | Usuario activa SOS y ningún agente responde | Proveedor de push falla; Seguridad | Persistir, mostrar pendiente y escalar | Registro durable antes de confirmar; escalamiento a los 2 min; comprobar outbox aunque push no llegue |
| EQ-07 Mantenibilidad | Desarrollador cambia proveedor de rutas | Prueba de contrato; Geolocalización | Sustituir adaptador y composición | Sin cambios en reglas de Viajes ni pantallas; suite de contrato aprobada |
| EQ-08 Disponibilidad | Sonda ejecuta cotización y comando de prueba | Mes completo; ruta crítica | Responder o registrar interrupción | RNF-08: 99.5%; en 30 días equivale a hasta 216 min de indisponibilidad; contar errores de dependencias que impiden el flujo |
| EQ-09 Recuperabilidad | Operador restaura tras pérdida de datos | Entorno aislado; Firestore y Storage | Recuperar referencias, documentos y ledger coherentes | Respaldo diario, retención 30 días; propuesta RPO de 24 h y RTO de 4 h; ensayo mensual |

## Método de medición

Registrar versión, dataset sintético, equipo, región, red, número de usuarios, duración y configuración. Medir una fase de calentamiento separada y un periodo estable propuesto de 30 minutos. Para fallos y dinero, conservar identificadores de operación y resultados, sin DNI, teléfonos, PIN ni documentos reales. El informe debe distinguir errores de negocio esperados de fallos técnicos.

El objetivo de 99.5% es una meta de MotoYa, no una garantía del proveedor. La recepción de SOS por un humano requiere métricas operativas adicionales.
