# System Flows

Purpose:
Summarize the important runtime, operational, and lifecycle flows inside the system.

This file explains how major components interact when the system is running.

Use this file to answer:

- How do requests and state changes move through the system?
- Which components participate in important flows?
- Where do persistence, side effects, or async behavior occur?
- Which runtime interactions are operationally sensitive?

Keep this file concise and flow-oriented.
Do not turn it into exhaustive endpoint documentation or implementation walkthroughs.

---

## Relationship To Architecture Files

| File | Role |
|---|---|
| `system-overview.md` | Static runtime structure and major components |
| `source-map.md` | Navigation from flows to related code |
| `module-boundaries.md` | Ownership and dependency constraints |
| `conventions.md` | Stable implementation conventions |
| `flows.md` | Important runtime and operational behavior |

Use this file to explain how the system behaves.
Use ADRs to explain why important flow tradeoffs were accepted.

---

## Flow Documentation Rules

Good flow descriptions:

- focus on important transitions
- identify component responsibilities
- identify trust boundaries
- identify persistence or side effects
- identify async or eventually consistent behavior
- identify failure-sensitive areas
- remain understandable without reading code first

Avoid:

- line-by-line implementation walkthroughs
- giant endpoint inventories
- stale debugging notes
- framework boilerplate
- duplicating source code behavior verbatim

---

## Recommended Flow Categories

| Flow Type | Examples |
|---|---|
| Request flow | UI → API → DB |
| Authentication flow | login, token refresh, session validation |
| Background processing | queues, workers, schedulers |
| Data synchronization | replication, caching, indexing |
| Deployment/runtime flow | CI/CD, startup, environment loading |
| Error handling flow | retries, rollback, dead-letter queues |
| External integration flow | payment, messaging, third-party APIs |
| Agent workflow flow | adoption, task lifecycle, memory promotion |

Not every project needs every category.
Only document flows that materially help onboarding, debugging, or impact analysis.

---

## Flow Template

```md
## [Flow Name]

### Goal

[What this flow achieves]

### Trigger

[What starts the flow]

### Components

- [component]
- [component]
- [component]

### High-Level Flow

1. ...
2. ...
3. ...

### State Changes

- [state change]
- [persistence]
- [cache update]

### Failure / Risk Areas

- [risk]
- [timeout]
- [consistency issue]

### Observability

- logs
- metrics
- traces
- alerts

### Related Code

- `path/to/module`
- `path/to/service`

### Related Docs

- `.acm/decisions/...`
- `.acm/tasks/...`
```

---

## Example Flow

## Example: Request → Service → Persistence

### Goal

Handle a user request while preserving validation, authorization, and persistence boundaries.

### Trigger

A user action or API request enters the system.

### Components

- UI/runtime entry point
- API/service layer
- domain logic
- persistence layer

### High-Level Flow

1. Request enters runtime boundary.
2. Authentication and authorization are validated.
3. Domain logic executes.
4. Persistence updates occur.
5. Response or async event is returned.

### Failure / Risk Areas

- inconsistent writes
- missing authorization
- retry duplication
- stale cache invalidation

### Related Docs

- `.acm/architecture/system-overview.md`
- `.acm/architecture/conventions.md`

---

## What Belongs Here

- important runtime flows
- operationally sensitive interactions
- high-level request and state transitions
- async and persistence boundaries
- major side effects and failure areas
- flow-to-code navigation hints

## What Does Not Belong Here

- endpoint-by-endpoint inventories
- task-local debugging notes
- temporary investigation logs
- implementation-level walkthroughs
- duplicated source code behavior
- exhaustive infrastructure documentation

---

## Agent Usage

Agents should read this file when:

- modifying cross-module runtime behavior
- debugging distributed or async failures
- changing authentication or persistence logic
- planning migrations affecting runtime behavior
- analyzing system impact
- onboarding into unfamiliar runtime flows

Agents should update this file when:

- a new operationally important flow appears
- component interaction changes materially
- runtime responsibilities move between components
- important failure behavior changes
- a previously undocumented critical flow becomes stable

Minor implementation refactors normally do not require updates.
