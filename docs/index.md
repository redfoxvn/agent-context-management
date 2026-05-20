# Documentation Index

## Purpose

This file is the repository context router.

Use it to decide:

- where durable knowledge lives
- which docs to read next
- which docs own which source of truth
- where to write task and durable updates

Do not treat this file as a replacement for detailed docs. Use it to navigate to the right context.
Do not put workflow details here. Use `docs/agent/task-workflow.md` for task lifecycle rules.

---

## Context Layers

| Layer | Path | Owns |
|---|---|---|
| Agent bootstrap | `AGENTS.md` | Minimal mandatory rules for coding agents |
| Documentation router | `docs/index.md` | Context map, source-of-truth map, write locations |
| Product context | `docs/product/` | Product purpose, users, domain concepts, glossary |
| Feature truth | `docs/features/` | Current expected behavior of active features |
| Task history | `docs/tasks/` | Work records, plans, investigations, verification, handoffs |
| Architecture | `docs/architecture/` | Technical structure, boundaries, flows, conventions, testing |
| Decisions | `docs/decisions/` | Durable decisions and rationale |
| Agent operations | `docs/agent/` | Context policy, workflows, tool policy, review, handoff, skills |
| Templates | `docs/templates/` | Schemas and execution contracts for reusable artifacts |

---

## Source of Truth

| Knowledge Type | Source of Truth |
|---|---|
| Product goal, users, domain terms | `docs/product/` |
| Current feature behavior | `docs/features/[feature-name]/behavior.md` |
| Feature API/interface contracts | `docs/features/[feature-name]/api.md` |
| Feature data model | `docs/features/[feature-name]/data-model.md` |
| Feature test expectations | `docs/features/[feature-name]/test-scenarios.md` |
| Feature history | `docs/features/[feature-name]/changelog.md` |
| Architecture constraints, flows, conventions | `docs/architecture/` |
| Durable decision rationale | `docs/decisions/` |
| Task working state and history | `docs/tasks/[task-folder]/` |
| Agent workflow and policies | `docs/agent/` |

Task docs are working/history records.
Feature docs describe verified current truth.
Decision docs explain why durable choices were made.

---

## Read Path

### Required

For non-trivial tasks:

1. `AGENTS.md`
2. `docs/index.md`
3. `docs/agent/context-policy.md`
4. `docs/agent/task-workflow.md`
5. Relevant durable docs, source code, and tests

### Conditional

Read only when relevant:

| File | Read When |
|---|---|
| `docs/agent/tool-policy.md` | before risky commands or mutating tools |
| `docs/agent/review-checklist.md` | before reporting completion |
| `docs/agent/session-handoff.md` | continuing or preserving incomplete/risky work |
| `docs/agent/memory-policy.md` | deciding what should become durable knowledge |
| `docs/agent/skills/index.md` | locating a reusable procedure |
| `docs/agent/skills/*/SKILL.md` | task requires that specific procedure |
| `docs/decisions/index.md` | understanding durable tradeoffs or historical rationale |
| `docs/adoption.md` | onboarding this framework into a real repository |
| `docs/templates/tasks/README.md` | understanding task artifact semantics and readiness expectations |

### Optional Reference

| File | Purpose |
|---|---|
| `docs/agent/operating-manual.md` | overview of the default operating loop |
| `docs/agent/failure-modes.md` | common agent mistakes and reminders |

Load only context relevant to the task. Do not read the entire repository by default.

---

## Key Index Files

| Index | Use |
|---|---|
| `docs/features/index.md` | Find active/deprecated feature docs |
| `docs/tasks/index.md` | Find active, recent, or important task records |
| `docs/decisions/index.md` | Find ADRs and durable decisions |
| `docs/agent/skills/index.md` | Find reusable agent skills |

Update index files when adding, renaming, deprecating, or completing important artifacts.

---

## Write Locations

| Need to write... | Write to... |
|---|---|
| Task request, plan, investigation, verification, handoff | `docs/tasks/[task-folder]/` |
| Current feature behavior/API/data/tests | `docs/features/[feature-name]/` |
| Architecture structure, boundaries, flows, conventions | `docs/architecture/` |
| Product/domain meaning | `docs/product/` |
| Durable decision rationale | `docs/decisions/` |
| Agent workflow/policy/skills | `docs/agent/` |
| Reusable artifact schema | `docs/templates/` |

Use `docs/templates/features/` when creating or refreshing durable feature docs.
Use `docs/templates/decisions/adr.template.md` when recording durable decisions.

Do not write scratch notes into durable docs.

---

## Promotion Rule

During a task:

```txt
docs/tasks/[task-folder]/ = working memory and task history
```

After verification:

```txt
docs/features/[feature-name]/ = current durable feature truth
```

For durable tradeoffs or long-term rationale:

```txt
docs/decisions/ = why an important choice was made
```

Promote task outputs into durable docs only when they describe verified current truth or explicitly accepted intended truth.

Do not promote investigation notes, implementation logs, or unverified assumptions into feature docs.

See also:

```txt
docs/agent/memory-policy.md
```

---

## Conflict Handling

If user request, docs, code, or tests conflict in a behavior-affecting way:

1. Stop.
2. Identify the conflicting sources.
3. Explain why the conflict matters.
4. Ask for or recommend a decision.

Do not silently choose one source for product behavior, API contracts, data integrity, security, auth, billing, public behavior, or architecture boundaries.
