# Domain Model

Purpose:
Describe core entities and relationships.

## Core Entities

| Entity | Description | Relationships |
|---|---|---|
| Actor | Human or system participant | Interacts with Resource |
| Resource | Domain-managed object | May belong to a Collection |
| Collection | Logical grouping boundary | Contains Resources |

---

## Important State/Lifecycle

| Entity | States |
|---|---|
| Resource | draft -> active -> archived |

---

## Constraints

- Actors may interact with multiple collections or resources.
- Archived entities may remain readable.
