# Agent Context Index

## Purpose

This file is the repository context router.

`.acm/` means Agent Context Management.

Use it to decide:

- where durable knowledge lives
- which docs to read next
- which docs own which source of truth
- where to write task and durable updates

Do not treat this file as a replacement for detailed docs. Use it to navigate to the right context.
Do not put workflow details here. Use `.acm/agent/task-workflow.md` for task lifecycle rules.

---

## Context Layers

| Layer | Path | Owns |
|---|---|---|
| Agent bootstrap | `AGENTS.md` | Minimal mandatory rules for coding agents |
| Context router | `.acm/index.md` | Context map, source-of-truth map, write locations |
| Product context | `.acm/product/` | Product purpose, users, domain concepts, glossary |
| Feature truth | `.acm/features/` | Current expected behavior of active features |
| Task history | `.acm/tasks/` | Work records, plans, investigations, verification, handoffs |
| Architecture | `.acm/architecture/` | Technical structure, boundaries, flows, conventions, testing |
| Decisions | `.acm/decisions/` | Durable decisions and rationale |
| Agent operations | `.acm/agent/` | Context policy, workflows, tool policy, review, handoff, skills |
| Templates | `.acm/templates/` | Schemas and execution contracts for reusable artifacts |

---

## Source of Truth

| Knowledge Type | Source of Truth |
|---|---|
| Product goal, users, domain terms | `.acm/product/` |
| Current feature behavior | `.acm/features/[feature-name]/behavior.md` |
| Feature API/interface contracts | `.acm/features/[feature-name]/api.md` |
| Feature data model | `.acm/features/[feature-name]/data-model.md` |
| Feature test expectations | `.acm/features/[feature-name]/test-scenarios.md` |
| Feature history | `.acm/features/[feature-name]/changelog.md` |
| Architecture constraints, flows, conventions | `.acm/architecture/` |
| Durable decision rationale | `.acm/decisions/` |
| Task working state and history | `.acm/tasks/[task-folder]/` |
| Agent workflow and policies | `.acm/agent/` |

Task docs are working/history records.
Feature docs describe verified current truth.
Decision docs explain why durable choices were made.

---

## Read Path

### Required

For non-trivial tasks:

1. `AGENTS.md`
2. `.acm/index.md`
3. `.acm/agent/context-policy.md`
4. `.acm/agent/task-workflow.md`
5. Relevant durable docs, source code, and tests

### Conditional

Read only when relevant:

| File | Read When |
|---|---|
| `.acm/agent/tool-policy.md` | before risky commands or mutating tools |
| `.acm/agent/review-checklist.md` | before reporting completion |
| `.acm/agent/session-handoff.md` | continuing or preserving incomplete/risky work |
| `.acm/agent/memory-policy.md` | deciding what should become durable knowledge |
| `.acm/agent/skills/index.md` | locating a reusable procedure |
| `.acm/agent/skills/*/SKILL.md` | task requires that specific procedure |
| `.acm/decisions/index.md` | understanding durable tradeoffs or historical rationale |
| `.acm/adoption.md` | onboarding this framework into a real repository |
| `.acm/templates/tasks/README.md` | understanding task artifact semantics and readiness expectations |

### Optional Reference

| File | Purpose |
|---|---|
| `.acm/agent/operating-manual.md` | overview of the default operating loop |
| `.acm/agent/failure-modes.md` | common agent mistakes and reminders |

Load only context relevant to the task. Do not read the entire repository by default.

---

## Key Index Files

| Index | Use |
|---|---|
| `.acm/features/index.md` | Find active/deprecated feature docs |
| `.acm/tasks/index.md` | Find active, recent, or important task records |
| `.acm/decisions/index.md` | Find ADRs and durable decisions |
| `.acm/agent/skills/index.md` | Find reusable agent skills |

Update index files when adding, renaming, deprecating, or completing important artifacts.

---

## Write Locations

| Need to write... | Write to... |
|---|---|
| Task request, plan, investigation, verification, handoff | `.acm/tasks/[task-folder]/` |
| Current feature behavior/API/data/tests | `.acm/features/[feature-name]/` |
| Architecture structure, boundaries, flows, conventions | `.acm/architecture/` |
| Product/domain meaning | `.acm/product/` |
| Durable decision rationale | `.acm/decisions/` |
| Agent workflow/policy/skills | `.acm/agent/` |
| Reusable artifact schema | `.acm/templates/` |

Use `.acm/templates/features/` when creating or refreshing durable feature docs.
Use `.acm/templates/decisions/adr.template.md` when recording durable decisions.

Do not write scratch notes into durable docs.

---

## Promotion Rule

During a task:

```txt
.acm/tasks/[task-folder]/ = working memory and task history
```

After verification:

```txt
.acm/features/[feature-name]/ = current durable feature truth
```

For durable tradeoffs or long-term rationale:

```txt
.acm/decisions/ = why an important choice was made
```

Promote task outputs into durable docs only when they describe verified current truth or explicitly accepted intended truth.

Do not promote investigation notes, implementation logs, or unverified assumptions into feature docs.

See also:

```txt
.acm/agent/memory-policy.md
```

---

## Conflict Handling

If user request, docs, code, or tests conflict in a behavior-affecting way:

1. Stop.
2. Identify the conflicting sources.
3. Explain why the conflict matters.
4. Ask for or recommend a decision.

Do not silently choose one source for product behavior, API contracts, data integrity, security, auth, billing, public behavior, or architecture boundaries.
