# C4 - Nivel 4: diseño de código de FinalizarViaje

**Componente ampliado:** Viajes, dentro del backend. Este nivel describe clases y contratos propuestos, no clases verificadas en el código de la app. Se complementa con una secuencia de ejecución.

## Clases

```mermaid
classDiagram
  class FinalizarViajeHandler {
    +manejar(request) ResultadoCierre
  }
  class FinalizarViaje {
    +ejecutar(comando, actor) ResultadoCierre
  }
  class CierreViajePort {
    <<interface>>
    +cerrarAtomico(comando, actor, politica) ResultadoCierre
  }
  class FirestoreCierreViajeAdapter {
    +cerrarAtomico(comando, actor, politica) ResultadoCierre
  }
  class Viaje {
    +String id
    +Estado estado
    +int distanciaMetros
    +int version
    +validarCierre(actor)
    +terminar()
  }
  class PoliticaComision {
    +calcularCentimos(instantanea) int
  }
  class ResultadoCierre {
    +String viajeId
    +int comisionCentimos
    +int totalPasajeroCentimos
    +int version
  }
  FinalizarViajeHandler --> FinalizarViaje
  FinalizarViaje --> CierreViajePort
  FinalizarViaje --> PoliticaComision
  CierreViajePort <|.. FirestoreCierreViajeAdapter
  FirestoreCierreViajeAdapter ..> Viaje
  FirestoreCierreViajeAdapter ..> PoliticaComision
  FinalizarViaje ..> ResultadoCierre
```

## Secuencia: finalizar sin duplicar comisión

```mermaid
sequenceDiagram
  actor C as Conductor
  participant A as App Flutter
  participant H as Handler
  participant U as FinalizarViaje
  participant T as Adaptador transaccional
  participant D as Firestore
  participant W as Procesador de avisos
  C->>A: Terminé viaje
  A->>H: viajeId, versión, clave idempotente
  H->>H: Validar sesión, esquema y actor
  H->>U: ejecutar(comando, actor)
  U->>T: cerrarAtomico(comando, actor, política)
  T->>D: Leer viaje, reserva, saldo y resultado previo
  alt Ya finalizado y actor autorizado
    D-->>T: Cierre persistido
  else EnViaje y versión válida
    T->>T: Validar dominio y calcular comisión
    T->>D: Commit atómico de cierre, ledger, reserva y outbox
    D-->>T: Confirmación
  end
  T-->>U: ResultadoCierre
  U-->>H: ResultadoCierre
  H-->>A: Terminado y montos definitivos
  D-->>W: Evento outbox pendiente
  W->>W: Entregar aviso con reintentos
```

## Contrato ilustrativo

```typescript
// Pseudocontrato: nombres y tipos para guiar la implementación.
interface FinalizarViajeCommand {
  viajeId: string;
  expectedVersion: number;
  idempotencyKey: string;
}
interface ResultadoCierre {
  viajeId: string;
  estado: 'Terminado';
  comisionCentimos: number;
  totalPasajeroCentimos: number;
  version: number;
}
interface CierreViajePort {
  cerrarAtomico(
    cmd: FinalizarViajeCommand,
    actorId: string,
    politica: PoliticaComision
  ): Promise<ResultadoCierre>;
}
```

El adaptador debe usar la entidad y política dentro del cierre transaccional, con datos leídos de forma consistente. Un método genérico `guardar(viaje)` por sí solo no cubre la atomicidad entre viaje, saldo y ledger. El procesamiento de avisos nunca vuelve a ejecutar el débito.

**Anterior:** [componentes](nivel3-componentes.md).
