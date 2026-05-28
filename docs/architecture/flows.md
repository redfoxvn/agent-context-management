# System Flows

## Plain Explanation

This file explains how important parts of the system behave at runtime.

Read this file when you need to answer:

> "When the system is running, how do requests, state changes, and components move and interact?"

This file is especially useful for:

- debugging
- impact analysis
- onboarding
- authentication changes
- async processing
- distributed systems reasoning

Do not use this file for:

- detailed implementation walkthroughs
- giant sequence diagrams for every endpoint
- temporary debugging notes
- task history
- framework boilerplate

Think of this file as:

```txt
system-overview.md = what components exist
flows.md           = how those components behave together
```

---

## Purpose

This file summarizes the important runtime, operational, and lifecycle flows inside the system.

The goal is not exhaustive sequence documentation.
The goal is helping humans and coding agents understand:

- how major components interact
- where requests and state transitions move
- where failures or side effects occur
- which parts of the system are operationally sensitive

This file should optimize:

- onboarding
- debugging
- impact analysis
- implementation planning
- verification planning
- subagent routing

---

## Context Contract

| Field | Value |
|---|---|
| Context type | Durable operational architecture context |
| Source of truth for | High-level runtime and interaction flows |
| Read when | Understanding system behavior or planning cross-boundary changes |
| Write when | Important flows change materially |
| Do not use for | Low-level implementation logs or exhaustive sequence diagrams |

In simpler terms:

- read this when changing runtime behavior
- update it when an important flow changes
- do not turn it into a giant endpoint-by-endpoint dump

---

## Relationship To Other Files

| File | Boundary |
|---|---|
| `system-overview.md` | explains static architecture structure |
| `conventions.md` | explains stable implementation conventions |
| `source-map.md` | routes agents to relevant code |
| `docs/decisions/` | explains why important flow tradeoffs exist |
| `docs/tasks/` | stores temporary investigation and debugging details |

Use this file to explain how the system behaves.
Use ADRs to explain why major flow decisions were accepted.

Example:

```txt
flows.md:
- login request flow
- background job flow
- payment callback flow

source-map.md:
- where related code lives

docs/tasks/:
- a specific debugging investigation
```

---

## Flow Documentation Rules

Good flow descriptions:

- focus on important transitions
- identify component responsibilities
- identify trust boundaries
- identify persistence or side effects
- identify async or eventually consistent behavior
- identify failure-sensitive areas
- stay understandable without reading code first

Avoid:

- line-by-line implementation walkthroughs
- framework boilerplate
- giant sequence dumps
- stale endpoint inventories
- duplicating source code behavior verbatim

---

## Recommended Flow Categories

Not every project needs every category.
Only document flows that materially help reasoning.

| Flow Type | Examples |
|---|---|
| Request flow | UI → API → DB |
| Authentication flow | login, token refresh, session validation |
| Background processing | queues, workers, schedulers |
| Data synchronization | replication, caching, indexing |
| Deployment/runtime flow | CI/CD, startup, environment loading |
| Error handling flow | retries, dead-letter queues, rollback |
| External integration flow | payment, messaging, third-party APIs |
| Agent workflow flow | adoption, task lifecycle, memory promotion |

---

## Flow Template

Use the following structure for important flows.

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

- `docs/decisions/...`
- `docs/tasks/...`
```

---

## Example Placeholder

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

- `docs/architecture/system-overview.md`
- `docs/architecture/conventions.md`

---

## Agent Usage

Agents should read this file when:

- modifying cross-module behavior
- debugging distributed failures
- changing authentication or persistence logic
- introducing async processing
- performing migrations affecting runtime behavior
- analyzing system impact

Agents should update this file when:

- a new operationally important flow appears
- component interaction changes materially
- runtime responsibilities move between components
- important failure behavior changes

Minor implementation refactors normally do not require updates.

---

## Readiness Checklist

This file is operationally useful when:

- important runtime flows are discoverable quickly
- component responsibilities are understandable
- trust boundaries are visible
- major side effects are identified
- async behavior and persistence boundaries are visible
- related code paths are discoverable
- flow descriptions remain shorter than the underlying implementation
