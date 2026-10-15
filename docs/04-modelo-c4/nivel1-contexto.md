# C4 - Nivel 1: contexto del sistema

**Alcance:** MotoYa como sistema completo. **Audiencia:** docente, responsables del negocio y usuarios. Las personas son actores; los bloques externos representan dependencias, sin detallar tecnologías internas.

```mermaid
flowchart LR
  P[Pasajero] -->|Solicita, negocia y sigue viajes| M[MotoYa: plataforma de moto lineal en Huamanga]
  C[Conductor] -->|Ofrece transporte y gestiona saldo| M
  S[Agente de soporte] -->|Revisa registros, recargas y alertas| M
  A[Administrador y dueño] -->|Supervisan y configuran| M
  T[Contador opcional] -->|Consulta finanzas| M
  M -->|Rutas y direcciones| G[Sistema externo de mapas]
  M -->|Verificación de identidad| I[Proveedor de identidad]
  M -->|Avisos push y SMS| N[Proveedor de notificaciones]
  M -->|Compartir datos por acción del usuario| W[WhatsApp]
  P -.->|Pago directo fuera de MotoYa| C
```

## Interpretación

MotoYa registra la relación entre pasajero, conductor y viaje. El pago directo queda fuera de su frontera: efectivo, Yape y Plin son medios elegidos por las personas, no integraciones de cobro automático del sistema. La recarga del conductor se acredita después de verificación humana por soporte.

El botón de emergencia facilita comunicación y crea una alerta, pero MotoYa no representa a los servicios de emergencia ni garantiza su intervención. La atención de soporte requiere personal disponible.

**Siguiente vista:** [contenedores](nivel2-contenedores.md).
