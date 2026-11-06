# Nivel 2: contenedores


**Pregunta:** ¿qué aplicaciones y servicios ejecutan la solución?

| Contenedor | Tecnología | Responsabilidad | Comunicación |
|---|---|---|---|
| App móvil | Flutter / Dart | Interfaz de pasajero y conductor | Auth, lecturas autorizadas, funciones, mapas y rutas. |
| Panel web | Flutter Web | Operación interna | Auth, consultas y comandos autorizados. |
| Backend | Cloud Functions / TypeScript | Cotizaciones, comandos y reglas críticas | Auth, Firestore, Storage y servicios externos. |
| Base de datos | Cloud Firestore | Estados, perfiles y movimientos | SDK cliente bajo reglas y SDK servidor con autorización propia. |
| Almacenamiento | Cloud Storage | Documentos y comprobantes | Cargas y lecturas restringidas. |
| Identidad | Firebase Auth | Sesión y verificación | App, panel y validación del backend. |

Un contenedor C4 no equivale necesariamente a Docker. El despliegue mantiene entornos separados para pruebas y operación.

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
  A -->|Cotización y comandos críticos| B
  P -->|Comandos autorizados| B
  A -->|Lecturas y escrituras acotadas por reglas| D
  P -->|Consultas según rol| D
  A -->|Cargas restringidas| S
  B -->|Transacciones| D
  B -->|Acceso a archivos| S
  B -->|Verifica identidad| I
  A -->|Visualiza el mapa con SDK| R[Proveedores de mapas y rutas]
  B -->|Consulta recorrido, distancia y duración| R
  B -.->|Recargas del conductor| MP[Mercado Pago]
```
