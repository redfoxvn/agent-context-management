# Framework Adoption Skill

## Purpose

Use this skill when adopting this context management framework into a real software repository.

This skill turns adoption into a controlled task workflow instead of a one-time documentation dump.

---

## Use When

Use this skill when the user asks to:

- adopt this framework into a new or existing repo
- prepare a repo for coding agents
- add context management to a codebase
- migrate legacy docs into this context structure
- build initial architecture, product, source-map, feature, or decision context

Do not use this skill for ordinary documentation edits.

---

## Bootstrap Boundary

This skill assumes the target repository already contains the minimal framework skeleton.

Minimum bootstrap set:

```txt
AGENTS.md
docs/index.md
docs/agent/
docs/templates/
docs/tasks/index.md
docs/features/index.md
docs/decisions/index.md
docs/architecture/
docs/product/
```

If these files do not exist yet:

- ask the user to bootstrap them manually
- or require explicit approval before creating them

After the bootstrap boundary exists, continue adoption through the normal task workflow.

---

## Inputs

Identify:

- target repository structure
- adoption mode: `greenfield`, `brownfield`, or `legacy-docs-migration`
- existing docs and whether they are current
- protected areas or risky domains
- user-provided constraints

If adoption mode is unclear and affects the approach, stop and ask.

---

## Procedure

### 1. Classify Adoption Mode

Choose the adoption path:

| Mode | Use When |
|---|---|
| `greenfield` | project is new or early-stage |
| `brownfield` | project already has meaningful code/history |
| `legacy-docs-migration` | project has existing docs/wiki/notes to triage |

For brownfield adoption, treat code and tests as primary evidence until durable docs are verified.

---

### 2. Create Adoption Task State

Create or update:

```txt
docs/tasks/[YYYY-MM-DD-adopt-context-framework]/task.md
```

Record:

- adoption mode
- scope
- existing docs found
- repo structure findings
- uncertainty
- verification performed
- remaining risks
- next actions

Use `handoff.md` if adoption is incomplete, multi-session, or risky.

---

### 3. Build Initial Architecture Context

Prioritize:

```txt
docs/architecture/source-map.md
```

Then expand into:

```txt
docs/architecture/system-overview.md
docs/architecture/module-boundaries.md
docs/architecture/flows.md
docs/architecture/conventions.md
```

Populate:

| File | Focus |
|---|---|
| `system-overview.md` | runtime shape, major components, external systems |
| `source-map.md` | stable mapping from product/domain areas to code and tests |
| `module-boundaries.md` | ownership and dependency constraints |
| `flows.md` | important runtime, auth, async, integration, or deployment flows |
| `conventions.md` | stable naming, organization, API, integration, testing, and documentation conventions |

Rules:

- keep mappings coarse-grained
- mark uncertain findings explicitly
- do not document every file or endpoint
- do not convert weak observations into durable conventions

---

### 4. Capture Critical Product Context

Draft only high-value product context:

- product purpose
- target users or operators
- goals and non-goals
- domain terms
- core entities
- business rules
- behavior that code alone does not explain

Use:

```txt
docs/product/overview.md
docs/product/glossary.md
docs/product/domain-model.md
docs/product/business-rules.md
```

Populate:

| File | Focus |
|---|---|
| `overview.md` | product purpose, users, goals, non-goals, and constraints |
| `glossary.md` | canonical terminology |
| `domain-model.md` | entities, relationships, and lifecycle |
| `business-rules.md` | stable behavioral constraints and policies |

Do not treat inferred product meaning or business rules as durable truth until confirmed.

---

### 5. Triage Legacy Docs

If legacy docs exist, classify them:

| Category | Action |
|---|---|
| verified durable truth | promote to product, architecture, feature, or decision docs |
| useful historical context | link from task or decision docs when relevant |
| stale or conflicting docs | archive, mark stale, or remove |
| task-specific notes | move or summarize into task docs only if still useful |

Do not bulk-import legacy docs.

---

### 6. Promote Verified Durable Truth

After verification, promote durable truth into the correct layer:

| Finding | Destination |
|---|---|
| current feature behavior | `docs/features/[feature-name]/` |
| technical boundary, convention, or flow | `docs/architecture/` |
| product purpose, domain meaning, or business rule | `docs/product/` |
| durable tradeoff or rationale | `docs/decisions/` |

Do not promote implementation logs, scratch notes, or unverified assumptions.

---

## Human Confirmation Required

Humans should confirm:

- initial framework bootstrap
- product meaning
- business rules
- architecture boundaries
- accepted conventions
- public API/product behavior decisions
- accepted ADRs
- whether legacy behavior is intended or stale

Agent drafts and verifies evidence.
Humans confirm durable truth.

---

## Stop Conditions

Stop and report when:

- adoption mode is unclear and affects the workflow
- framework bootstrap has not happened yet
- existing docs conflict with code or tests
- legacy docs may describe intended behavior but code differs
- product terms cannot be inferred safely
- business rules affect user-visible behavior
- architecture boundaries are unclear or currently violated
- adoption would overwrite existing docs or user work
- verification is impossible or unreliable

---

## Output

A good adoption pass should produce:

- framework skeleton confirmed
- adoption task state recorded
- initial architecture context draft or update
- initial product context draft or update
- important flows and conventions identified when possible
- legacy docs triage notes, if applicable
- explicit uncertainty and human-review items
- no unverified assumptions promoted into durable docs
