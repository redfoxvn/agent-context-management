# Module Boundaries

Purpose:
Define stable ownership and dependency constraints between modules.

This file should describe architectural boundaries, not implementation details.

## Rules

- Prefer directional dependencies.
- Avoid cross-module internal access.
- Shared utilities should remain generic and dependency-light.
- Cross-module interaction should use stable public interfaces.

---

## Modules

| Module | Responsibility | May Depend On | Must Not Depend On |
|---|---|---|---|
| `[module-a]` | `[responsibility]` | `[allowed-dependencies]` | `[disallowed-dependencies]` |
| `[module-b]` | `[responsibility]` | `[allowed-dependencies]` | `[disallowed-dependencies]` |

---

## Integration Rules

- Avoid importing internal implementation details across modules.
- Shared contracts should remain minimal and stable.
- Boundary violations should be treated as architecture changes.

---

## Agent Usage

Agents should read this file when:
- modifying multiple modules
- introducing new dependencies
- refactoring shared logic
- deciding where new code belongs

Agents should update this file when:
- ownership changes
- dependency rules change
- a new stable module is introduced
