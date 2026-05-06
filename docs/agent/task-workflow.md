# Task Workflow

## Purpose

This file is the canonical source for task classification, workflows, skills, templates, and task artifact guidance.

Use it after:

- `AGENTS.md`
- `docs/index.md`
- `docs/agent/context-policy.md`

---

## Mental Model

```txt
Workflow = task lifecycle
Skill    = reusable tactical heuristic used inside a workflow step
Template = artifact schema
Task docs = what happened during a task
Feature docs = what is true now
```

Skill files live at:

```txt
docs/agent/skills/[skill-name]/SKILL.md
```

Templates live at:

```txt
docs/templates/tasks/[task-classification]/
```

---

## Core Rules

For non-trivial tasks:

1. Classify the task.
2. Load context using `docs/agent/context-policy.md`.
3. Create or update `docs/tasks/[YYYY-MM-DD-task-slug]/`.
4. Keep task artifacts proportional to risk.
5. Plan before implementation.
6. Verify before completion.
7. Update durable docs only when durable truth changes.
8. Update handoff when work is incomplete, risky, long-running, or non-obvious.

Do not create verbose docs just to satisfy a template.

## Task Folder Granularity

Default rule:

```txt
one task folder = one user outcome or one logical feature/change
```

Do not create a new task folder just because implementation has multiple parts, phases, or workstreams.
Keep tightly related work in one folder and record the internal progress in task artifacts.

Keep using the same task folder when:

- the parts contribute to the same user-visible outcome
- the work shares one main classification and workflow
- the parts depend on the same acceptance criteria to be considered done
- splitting would mostly duplicate context, plan, or verification history

Create a new task folder when:

- the work becomes a different logical outcome
- the classification or workflow changes materially
- a part can ship, roll back, or be verified independently
- risk, ownership, or durable decision scope has clearly separated

For multi-phase work inside one task folder:

- record phases or workstreams in `task.md` or `plan.md`
- update task state as each phase progresses
- use `handoff.md` to show what is done, what remains, and whether the overall outcome is complete
- mark the task `completed` only when the whole outcome is complete

---

## Classification

| Classification | Use When | Template |
|---|---|---|
| `new-feature` | Adding a capability that did not exist before | `docs/templates/tasks/new-feature/` |
| `change-feature` | Changing existing feature behavior | `docs/templates/tasks/change-feature/` |
| `bugfix` | Fixing incorrect behavior, regression, failing tests, or runtime errors | `docs/templates/tasks/bugfix/` |
| `refactor` | Changing internal structure without intended behavior change | `docs/templates/tasks/refactor/` |
| `migration` | Changing schema, data shape, dependency, framework, runtime, or infrastructure | `docs/templates/tasks/migration/` |
| `performance` | Improving latency, throughput, memory, bundle size, query cost, or resource usage | `docs/templates/tasks/performance/` |
| `security` | Fixing or improving auth, permissions, validation, secrets, trust boundaries, or data exposure | `docs/templates/tasks/security/` |
| `test-improvement` | Adding or improving tests without intended product behavior change | `docs/templates/tasks/test-improvement/` |
| `docs` | Documentation-only changes | `docs/templates/tasks/docs/` |
| `spike` | Research, exploration, proof of concept, or decision support | `docs/templates/tasks/spike/` |

If classification is uncertain and affects workflow materially, stop and report the ambiguity.

---

## Task Artifact Levels

Default to the smallest artifact set that preserves state safely.

| Level | Use When | Files |
|---|---|---|
| Minimal | small or low-risk non-trivial task | `task.md` |
| Standard | implementation needs explicit verification or progress tracking | `task.md`, optional `verification.md` |
| Handoff / Risky | task is incomplete, risky, long-running, multi-session, or decision-heavy | `task.md`, optional `plan.md`, `verification.md`, `handoff.md` |

Prefer a single `task.md` unless splitting improves continuation, review, or verification.

### Suggested `task.md` Sections

Use only sections that add value:

- Status
- Request / Goal
- Classification
- Scope / Non-goals
- Context / Findings
- Plan
- Changes
- Verification
- Decisions / Risks
- Next Action

### Classification-Specific Focus

| Classification | Focus |
|---|---|
| `new-feature` | request, expected behavior, impact, plan, verification, durable docs |
| `change-feature` | current behavior, proposed behavior, impact, preserved behavior, verification |
| `bugfix` | expected vs actual behavior, reproduction, root cause or hypothesis, regression coverage |
| `refactor` | motivation, scope, non-goals, preserved behavior, verification |
| `migration` | current state, target state, compatibility, rollback, verification |
| `performance` | symptom, baseline, bottleneck, correctness, before/after evidence |
| `security` | asset, trust boundary, risk, remediation, negative/security verification |
| `test-improvement` | test gap, expected behavior, coverage added, remaining gaps |
| `docs` | owning source of truth, changed docs, consistency check |
| `spike` | question, findings, options, tradeoffs, recommendation |

---

## Workflow Summary

| Classification | Workflow |
|---|---|
| `new-feature` | capture request -> research context -> draft behavior -> analyze impact -> plan -> implement -> test -> verify -> promote feature docs -> handoff |
| `change-feature` | capture change -> read current behavior -> define proposed behavior -> analyze impact -> plan -> implement -> test -> verify changed/preserved behavior -> update durable docs -> handoff |
| `bugfix` | capture report -> reproduce or state fix hypothesis -> investigate -> identify root cause -> plan minimal fix -> add regression test -> implement -> verify -> update docs if needed -> handoff |
| `refactor` | capture motivation/scope -> identify behavior to preserve -> check boundaries/conventions -> identify tests -> plan small steps -> implement -> verify preservation -> update architecture docs if needed -> handoff |
| `migration` | capture current/target state -> analyze affected data/runtime/dependencies -> plan migration and rollback -> implement incrementally -> verify compatibility/result -> update durable docs -> handoff |
| `performance` | capture metric/problem -> baseline -> identify bottleneck -> analyze correctness risk -> plan -> implement -> verify correctness -> compare before/after -> update docs/ADR if needed -> handoff |
| `security` | capture concern/asset -> identify trust boundaries -> analyze impact -> plan remediation -> add security tests -> implement -> verify -> update security docs/ADR if needed -> handoff |
| `test-improvement` | identify test gap -> read expected behavior -> inspect implementation as needed -> plan tests -> implement -> verify fail/pass when possible -> update test scenarios if needed -> handoff |
| `docs` | identify owning source of truth -> update docs -> check consistency -> update indexes -> verify paths/terminology -> handoff if needed |
| `spike` | define question -> gather context -> record findings -> compare options -> recommend next action -> record ADR candidate if needed -> handoff |

---

## Skills by Classification

Skills are optional tactical references. Do not read every skill by default.

| Classification | Skills |
|---|---|
| `new-feature` | requirement-analysis, codebase-research, impact-analysis, implementation-planning, test-design, decision-recording |
| `change-feature` | requirement-analysis, codebase-research, impact-analysis, implementation-planning, test-design, decision-recording |
| `bugfix` | bugfix, codebase-research, impact-analysis, implementation-planning, test-design |
| `refactor` | refactor, codebase-research, impact-analysis, implementation-planning, test-design, decision-recording |
| `migration` | migration, codebase-research, impact-analysis, implementation-planning, test-design, decision-recording |
| `performance` | performance-optimization, codebase-research, impact-analysis, implementation-planning, test-design, decision-recording |
| `security` | security-remediation, codebase-research, impact-analysis, implementation-planning, test-design, decision-recording |
| `test-improvement` | test-design, codebase-research, impact-analysis, implementation-planning |
| `docs` | codebase-research, impact-analysis |
| `spike` | spike-research, codebase-research, impact-analysis, decision-recording |

Use `docs/agent/skills/index.md` to find skill procedures.

---

## Removed Generic Skills

The following former skills were removed because their guidance is already covered by core workflow, review, or index rules:

| Removed Skill | Replacement |
|---|---|
| `implementation` | `implementation-planning` + workflow summary |
| `verification` | `docs/agent/review-checklist.md` + workflow summary |
| `documentation-update` | `docs/index.md` write locations + promotion rule |
| `session-handoff` | `docs/agent/session-handoff.md` |

---

## Reclassification Rules

Reclassify when actual work differs from the initial classification.

| Initial | Reclassify To | When |
|---|---|---|
| `refactor` | `change-feature` | Behavior must change |
| `test-improvement` | `bugfix` | Test reveals an actual defect |
| `docs` | `bugfix` / `change-feature` | Docs reveal behavior/code mismatch |
| `bugfix` | `change-feature` | Fix requires redefining expected behavior |
| `new-feature` | `change-feature` | Capability already exists and behavior is changing |
| `performance` | `change-feature` | Optimization changes user-visible behavior |
| `migration` | `change-feature` | Migration changes feature behavior |

When reclassifying, record the reason, switch workflow, add needed artifacts, and refresh context.

---

## Stop Conditions

Stop and report when:

- task classification is uncertain and affects workflow
- required artifacts cannot be completed because expected behavior is unclear
- selected workflow conflicts with context policy, architecture docs, or ADRs
- verification required by the workflow is impossible or unreliable

For broader conflict handling, follow `docs/agent/context-policy.md`.
