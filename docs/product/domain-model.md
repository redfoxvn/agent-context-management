# Domain Model

Purpose:
Describe core entities and relationships.

## Core Entities

| Entity | Description | Relationships |
|---|---|---|
| User | System account | Owns Workspace |
| Workspace | Collaboration space | Contains Projects |

---

## Important State/Lifecycle

| Entity | States |
|---|---|
| Project | draft -> active -> archived |

---

## Constraints

- A user may belong to multiple workspaces.
- Archived entities remain readable.
