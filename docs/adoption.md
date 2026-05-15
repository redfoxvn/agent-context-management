# Adoption Guide

## Purpose

Use this guide to adapt the context management framework into a real software repository.

Start small. Fill only the context that helps agents work safely.
Do not create empty docs just to mirror the framework structure.

---

## Adoption Scenarios

### Greenfield Adoption

Use this path when adopting the framework at the start of a new project.

Goal:

```txt
Set up context routing before code and docs become fragmented.
```

Recommended approach:

1. Copy the minimal framework skeleton.
2. Fill product and architecture context only at skeleton level.
3. Use task docs from the first non-trivial task.
4. Let feature docs grow from verified work.
5. Record decisions only for durable tradeoffs.

Greenfield rule:

```txt
Start with minimal skeleton and let durable docs grow from verified work.
Do not pre-fill imaginary architecture, product, or feature docs.
```

---

### Brownfield Adoption

Use this path when adopting the framework into an existing project.

Goal:

```txt
Create safe entry points for agents without documenting the entire system upfront.
```

Recommended approach:

1. Install the framework skeleton.
2. Build `docs/architecture/source-map.md` first.
3. Capture only critical product terms and business rules.
4. Treat existing docs as unverified unless they are known to be current.
5. Grow feature docs task-by-task from touched areas.
6. Promote durable truth only after verification against current code and tests.

Brownfield rule:

```txt
Do not document everything upfront.
Build context through task-driven verification.
Code and tests remain primary evidence until durable docs are verified.
```

---

### Legacy Docs Migration

Use this when the project already has README files, wiki pages, Notion docs, Confluence pages, or scattered notes.

Do not bulk-import old docs.

Triage existing docs into:

| Category | Action |
|---|---|
| Verified durable truth | Promote into product, architecture, feature, or decision docs |
| Useful historical context | Link from task or decision docs when relevant |
| Stale or conflicting docs | Archive, mark stale, or remove |
| Task-specific notes | Move or summarize into task docs only if still useful |

Migration rule:

```txt
Only promote legacy docs after checking them against current code, tests, or accepted product truth.
```

---

## Adoption Workflow

Framework adoption itself should be treated as a task workflow.

For a real repository, do not treat adoption as a one-time documentation dump. Split it into small tasks that can be investigated, verified, reviewed, and promoted safely.

Example adoption tasks:

- add framework skeleton
- build source map
- migrate glossary
- verify business rules
- recover architecture boundaries
- migrate durable decisions
- review legacy docs

Use task docs to record:

- findings
- uncertainty
- verification
- migration progress
- remaining risks
- next actions

Promote durable truth only after verification.

Adoption rule:

```txt
Adoption work uses the same task workflow as implementation work.
Agent drafts and records findings; humans confirm durable truth.
```

---

## Human And Agent Responsibilities

Agent can safely:

- copy the framework skeleton
- draft source maps
- create task folders
- inspect source code and tests
- record findings and uncertainty
- draft durable docs after verification

Humans should confirm:

- product meaning
- business rules
- architecture boundaries
- accepted decisions
- whether legacy behavior is intended or stale

Responsibility rule:

```txt
Agent drafts and verifies evidence.
Humans confirm durable truth.
```

---

## Default Adoption Order

Use this as a default sequence.
For brownfield projects, prioritize `source-map.md` and task-driven verification before expanding durable docs.

### 1. Copy The Bootstrap Files

Start with:

```txt
AGENTS.md
docs/index.md
docs/agent/
docs/templates/
```

Keep `AGENTS.md` short and mandatory.
Use `docs/index.md` as the context router.

---

### 2. Fill Architecture Context

Create or update:

```txt
docs/architecture/source-map.md
docs/architecture/system-overview.md
docs/architecture/module-boundaries.md
```

Prioritize:

- where important code lives
- major runtime components
- module boundaries
- constraints agents must not violate

Avoid documenting every file or function.

---

### 3. Fill Product Context

Create or update:

```txt
docs/product/glossary.md
docs/product/domain-model.md
docs/product/business-rules.md
```

Prioritize:

- domain terms
- core entities
- durable business rules
- behavior that code alone does not explain

Avoid speculative product ideas unless explicitly marked as draft.

---

### 4. Add Feature Docs Only For Important Features

Use feature docs when future agents need durable current truth.

Recommended structure:

```txt
docs/features/[feature-name]/
├── behavior.md
├── api.md
├── data-model.md
├── test-scenarios.md
└── changelog.md
```

Use only the files that add value.
Small features may only need `behavior.md` and `test-scenarios.md`.

Use templates from:

```txt
docs/templates/features/
```

---

### 5. Use Task Docs During Work

For non-trivial work, create:

```txt
docs/tasks/[YYYY-MM-DD-task-slug]/
```

Start with `task.md`.
Add `verification.md` or `handoff.md` only when needed.

Task docs record:

- request
- context found
- plan
- changes
- verification
- risks
- next action

Task docs are working memory and history.
They are not the final source of truth.

---

### 6. Promote Verified Truth

After a task is verified, promote durable truth into the right layer:

| Finding | Promote To |
|---|---|
| Current feature behavior | `docs/features/[feature-name]/` |
| Technical boundary or flow | `docs/architecture/` |
| Domain meaning or business rule | `docs/product/` |
| Durable tradeoff or rationale | `docs/decisions/` |

Do not promote implementation logs, scratch notes, or unverified assumptions.

---

### 7. Record Decisions Sparingly

Create decision records only when future agents need to understand why a durable choice was made.

Good candidates:

- architecture boundaries
- technology choices
- data model direction
- public API contracts
- migration strategies
- security/auth tradeoffs

Avoid decision records for minor implementation details or task-local choices.

Use:

```txt
docs/templates/decisions/adr.template.md
```

---

## Initial Adoption Checklist

Before asking an agent to implement real changes, ensure:

- `AGENTS.md` points to the correct read path
- `docs/index.md` reflects actual folders in the repo
- `docs/architecture/source-map.md` maps important areas of code
- `docs/product/glossary.md` defines common domain terms
- `docs/tasks/index.md` exists
- templates are available under `docs/templates/`
- existing docs are treated as unverified unless confirmed current

---

## Anti-Bloat Rules

- Do not require every feature to have every recommended file.
- Do not create task artifacts that do not help continuation or verification.
- Do not duplicate source code structure in docs.
- Do not turn changelogs into implementation logs.
- Do not create ADRs for obvious or local choices.
- Prefer concise durable truth over complete wiki coverage.

---

## Agent Usage Protocol

For non-trivial tasks, agents should:

1. Read `AGENTS.md`.
2. Use `docs/index.md` to route context.
3. Read `docs/agent/context-policy.md` and `docs/agent/task-workflow.md`.
4. Read relevant architecture, product, feature, decision, source, and test context.
5. Create or update a task folder.
6. Plan before changing code.
7. Verify before completion.
8. Promote durable truth only after verification.
9. Update handoff when work remains incomplete or risky.

During adoption tasks, agents should record uncertainty explicitly instead of promoting assumptions into durable docs.
