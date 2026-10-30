# Nivel 2: contenedores


**Pregunta:** ¿qué aplicaciones y servicios ejecutan la solución?

| Contenedor | Tecnología | Responsabilidad | Comunicación |
|---|---|---|---|
| App móvil | Flutter / Dart | Interfaz de pasajero y conductor | Auth, lecturas autorizadas, funciones, mapas y rutas. |
| Panel web | Flutter Web | Operación interna | Auth, consultas y comandos autorizados. |
| Backend | Cloud Functions / TypeScript | Comandos y reglas críticas | Auth, Firestore, Storage y servicios externos. |
| Base de datos | Cloud Firestore | Estados, perfiles y movimientos | SDK cliente bajo reglas y SDK servidor con autorización propia. |
| Almacenamiento | Cloud Storage | Documentos y comprobantes | Cargas y lecturas restringidas. |
| Identidad | Firebase Auth | Sesión y verificación | App, panel y validación del backend. |

Un contenedor C4 no equivale necesariamente a Docker. Tampoco indica que el servicio esté desplegado. El mapa de despliegue debe diferenciar demo local y producción.

---

[Volver al índice](../../README.md)

## Diagrama

```mermaid
flowchart TB
  subgraph M[MotoYa]
    A[App Flutter]
    P[Panel Flutter Web]
    B[Backend Cloud Functions]
    D[(Cloud Firestore)]
    S[(Cloud Storage)]
    I[Firebase Auth]
  end
  A -->|Autenticación| I
  P -->|Autenticación| I
  A -->|Comandos críticos en LIVE| B
  P -->|Comandos autorizados| B
  A -->|Lecturas y escrituras acotadas por reglas| D
  P -->|Consultas según rol| D
  A -->|Cargas restringidas| S
  B -->|Transacciones| D
  B -->|Acceso a archivos| S
  B -->|Verifica identidad| I
  A -->|Mapa, búsqueda y ruta actual| R[Proveedores de mapas y rutas]
  B -.->|Recarga integrada configurable| MP[Mercado Pago]
```
