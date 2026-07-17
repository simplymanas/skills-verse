# Prompt Fragment — Diagram Generation

Use this prompt fragment when generating the Diagrams section of
`ARCHITECTURE_DOCUMENTATION.md`.

---

## Rules before drawing

- Only diagram components that were verified in the codebase.
- Do not draw databases, queues, or services that appear in docs but not in
  code or config.
- If a component's role is ambiguous, label it with a `?` suffix.

---

## Required diagrams and their Mermaid templates

### 1. System Context

```mermaid
C4Context
  Person(user, "End User")
  System(system, "<System Name>", "<One-line description>")
  System_Ext(ext1, "<External System>", "<Role>")
  Rel(user, system, "<interaction>")
  Rel(system, ext1, "<protocol>")
```

### 2. High-Level Architecture

```mermaid
flowchart TD
    A[<Entry Point>] --> B[<Layer 2>]
    B --> C[<Layer 3>]
    C --> D[(<Datastore>)]
```

### 3. Request Sequence (auth or most complex flow)

```mermaid
sequenceDiagram
    participant U as User
    participant S as <Service>
    participant DB as <Datastore>
    U->>S: <request>
    S->>DB: <query>
    DB-->>S: <result>
    S-->>U: <response>
```

### 4. ER Diagram (only if a DB schema is present)

```mermaid
erDiagram
    TABLE_A {
        int id PK
        string field1
    }
    TABLE_B {
        int id PK
        int table_a_id FK
    }
    TABLE_A ||--o{ TABLE_B : "has"
```

---

## After drawing

Ask the user:
> "Would you like these diagrams exported as draw.io files as well, or is
> Mermaid sufficient?"

Wait for the answer before producing any draw.io output.
