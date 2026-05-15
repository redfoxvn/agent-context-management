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

### 3. Install Minimal Skeleton

Add only the context framework pieces needed for safe operation:

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

Do not create empty feature docs just to mirror the framework.

---

### 4. Build Initial Source Map

For brownfield adoption, prioritize:

```txt
docs/architecture/source-map.md
```

Draft mappings from product/domain concepts to:

- modules
- entry points
- key files
- tests

Keep mappings coarse-grained.
Mark uncertain mappings explicitly.

---

### 5. Capture Critical Product Context

Draft only high-value product context:

- domain terms
- core entities
- business rules
- behavior that code alone does not explain

Use:

```txt
docs/product/glossary.md
docs/product/domain-model.md
docs/product/business-rules.md
```

Do not treat inferred business rules as durable truth until confirmed.

---

### 6. Triage Legacy Docs

If legacy docs exist, classify them:

| Category | Action |
|---|---|
| verified durable truth | promote to product, architecture, feature, or decision docs |
| useful historical context | link from task or decision docs when relevant |
| stale or conflicting docs | archive, mark stale, or remove |
| task-specific notes | move or summarize into task docs only if still useful |

Do not bulk-import legacy docs.

---

### 7. Promote Verified Durable Truth

After verification, promote durable truth into the correct layer:

| Finding | Destination |
|---|---|
| current feature behavior | `docs/features/[feature-name]/` |
| technical boundary or flow | `docs/architecture/` |
| domain meaning or business rule | `docs/product/` |
| durable tradeoff or rationale | `docs/decisions/` |

Do not promote implementation logs, scratch notes, or unverified assumptions.

---

## Human Confirmation Required

Humans should confirm:

- product meaning
- business rules
- architecture boundaries
- public API/product behavior decisions
- accepted ADRs
- whether legacy behavior is intended or stale

Agent drafts and verifies evidence.
Humans confirm durable truth.

---

## Stop Conditions

Stop and report when:

- adoption mode is unclear and affects the workflow
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

- framework skeleton installed or confirmed
- adoption task state recorded
- initial source map draft or update
- critical product context draft or update
- legacy docs triage notes, if applicable
- explicit uncertainty and human-review items
- no unverified assumptions promoted into durable docs
