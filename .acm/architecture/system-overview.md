# System Overview

## Purpose

Describe the high-level runtime structure, major system components, and important interactions.

Keep this file concise. Do not turn it into a full infrastructure inventory.

---

## Runtime Components

| Layer | Components | Responsibility |
|---|---|---|
| `[client-or-web-layer]` | `[frameworks-or-runtime]` | `[user-facing responsibility]` |
| `[backend-or-service-layer]` | `[frameworks-or-runtime]` | `[API, coordination, domain behavior, or persistence responsibility]` |
| `[data-layer]` | `[databases, caches, storage]` | `[data ownership, caching, persistence, or retrieval responsibility]` |
| `[infrastructure-layer]` | `[networking, deployment, compute, observability]` | `[hosting, routing, deployment, monitoring, or operational responsibility]` |

---

## High-Level Interaction

```txt
[external actor]
  -> [routing / entrypoint]
  -> [client or web runtime]
  -> [backend or service layer]
  -> [data stores or external systems]
```

---

## Important Flows

| Flow | Summary |
|---|---|
| `[flow-name]` | `[brief description of how the request, data, or event moves through the system]` |
| `[flow-name]` | `[brief description of the important runtime interaction]` |

---

## External Dependencies

| Dependency | Used By | Purpose |
|---|---|---|
| `[external-system-or-service]` | `[owning layer/component]` | `[why the system depends on it]` |

---

## Constraints

- `[client/web boundary rule]`
- `[backend/service ownership rule]`
- `[data access or persistence rule]`
- `[infrastructure or deployment rule]`

---

## Agent Usage

Agents should read this file when:
- onboarding into the project
- planning work that crosses multiple runtime layers
- debugging request, data, event, or deployment flow
- checking whether a change affects system-level behavior

Agents should update this file when:
- runtime components change
- important interactions change
- external dependencies are added or removed
- system-level constraints change
