# C4 - Nivel 2: contenedores

**Alcance:** unidades de ejecución y almacenamiento de MotoYa. En C4, contenedor no significa necesariamente Docker. **Audiencia:** equipo de desarrollo y operación.

```mermaid
flowchart TB
  U[Pasajero / conductor] --> APP
  O[Personal autorizado] --> PANEL
  subgraph MOTOYA[Entorno del sistema MotoYa]
    APP[App móvil - Flutter / Dart]
    PANEL[Panel web - Flutter Web / Hosting]
    API[Backend de comandos - Cloud Functions / TypeScript]
    WORKER[Procesador de eventos - Cloud Functions]
    AUTH[Identidad - Firebase Auth]
    DB[(Datos y outbox - Cloud Firestore)]
    FILES[(Documentos privados - Cloud Storage)]
  end
  APP -->|HTTPS: autenticación| AUTH
  PANEL -->|HTTPS: sesión y segundo factor| AUTH
  APP -->|HTTPS: comandos y token| API
  PANEL -->|HTTPS: comandos y token| API
  APP -->|SDK: lecturas autorizadas y suscripciones| DB
  PANEL -->|SDK: lecturas según rol| DB
  APP -->|HTTPS: cargas propias restringidas| FILES
  API -->|SDK servidor: transacciones| DB
  API -->|SDK servidor: acceso controlado| FILES
  API -->|Verificación de identidad| AUTH
  DB -->|Evento pendiente| WORKER
  WORKER -->|Registrar resultado| DB
  WORKER -->|HTTPS| MSG[FCM / proveedor SMS]
  API -->|HTTPS: rutas y direcciones| MAP[Google Maps Platform]
  APP -->|SDK: mapa visual| MAP
  API -.->|HTTPS: respaldo opcional| ALT[GraphHopper / Photon]
```

## Responsabilidades y despliegue

- **Móvil:** Android primero, modos pasajero/conductor y ubicación; almacena solo lo necesario para recuperar la experiencia.
- **Panel:** interfaz separada con roles, segundo factor y auditoría; dominio de publicación propuesto `admin.motoya.pe`, sin afirmar que esté desplegado.
- **Backend:** autoridad sobre reglas críticas y control de acceso; funciones organizadas en módulos.
- **Datos:** Firestore conserva estados y registros; Storage conserva archivos privados, evitando incrustarlos en documentos.
- **Procesador:** reintenta entrega de avisos; el estado de negocio permanece en el backend.

Desarrollo y producción usarán proyectos separados. Los secretos de servicios externos se almacenarán fuera del repositorio. El respaldo de mapas agrega infraestructura propia y requiere monitoreo, datos actualizados y mantenimiento antes de activarse.

**Anterior:** [contexto](nivel1-contexto.md). **Siguiente:** [componentes](nivel3-componentes.md).
