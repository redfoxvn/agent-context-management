# Module Boundaries

Purpose:
Define stable ownership and dependency constraints.

## Rules

- Prefer directional dependencies.
- Avoid cross-module internal access.
- Shared utilities must remain generic.

---

## Modules

| Module | Responsibility | May Depend On | Must Not Depend On |
|---|---|---|---|
| ui | Rendering and interaction | api-client | database |
| api | Business logic | domain, infra | ui |
| domain | Core rules and models | shared | ui |

---

## Integration Rules

- Cross-module interaction should use public interfaces.
- Avoid importing internal implementation details across modules.
- Shared models should remain stable and minimal.
