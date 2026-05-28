# Domain Model

Purpose:
Describe core entities, relationships, and lifecycle at the business/domain level.

Keep this file behavior-oriented and implementation-agnostic.

## Core Entities

| Entity | Description | Relationships |
|---|---|---|
| `[entity]` | `[business meaning]` | `[relationships]` |
| `[entity]` | `[business meaning]` | `[relationships]` |

---

## Important Lifecycle / States

| Entity | States |
|---|---|
| `[entity]` | `[state-a] -> [state-b] -> [state-c]` |

---

## Constraints

- `[durable business constraint]`
- `[ownership or lifecycle rule]`

---

## Agent Usage

Agents should read this file when:
- implementing behavior tied to domain entities
- validating lifecycle assumptions
- performing impact analysis across related concepts
- translating business rules into implementation

Agents should update this file when:
- entity relationships change
- lifecycle rules change
- durable domain concepts are introduced or removed
