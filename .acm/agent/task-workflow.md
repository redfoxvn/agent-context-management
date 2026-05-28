# Task Workflow

## Purpose

This file is the canonical source for task classification, workflow lifecycle, skills, templates, profiles, and task artifact guidance.

Use it after:

- `AGENTS.md`
- `.acm/index.md`
- `.acm/agent/context-policy.md`

---

## Mental Model

```txt
Workflow  = task lifecycle
Template  = artifact structure
Profile   = classification-specific attention
Skill     = tactical heuristic
Task docs = what happened during a task
Feature docs = what is true now
```

Task templates live at:

```txt
.acm/templates/tasks/*.template.md
```

Task profiles live at:

```txt
.acm/templates/tasks/profiles/[task-classification].md
```

Skill files live at:

```txt
.acm/agent/skills/[skill-name]/SKILL.md
```

---

## Core Rules

For non-trivial tasks:

1. Classify the task.
2. Load context using `.acm/agent/context-policy.md`.
3. Create or update `.acm/tasks/[YYYY-MM-DD-task-slug]/`.
4. Use `.acm/templates/tasks/task.template.md` as the default structure.
5. Use the matching task profile for classification-specific focus.
6. Keep task artifacts proportional to risk.
7. Plan before implementation.
8. Verify before completion.
9. Update durable docs only when durable truth changes.
10. Update handoff when work is incomplete, risky, long-running, or non-obvious.

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

| Classification | Use When | Profile |
|---|---|---|
| `new-feature` | Adding a capability that did not exist before | `.acm/templates/tasks/profiles/new-feature.md` |
| `change-feature` | Changing existing feature behavior | `.acm/templates/tasks/profiles/change-feature.md` |
| `bugfix` | Fixing incorrect behavior, regression, failing tests, or runtime errors | `.acm/templates/tasks/profiles/bugfix.md` |
| `refactor` | Changing internal structure without intended behavior change | `.acm/templates/tasks/profiles/refactor.md` |
| `migration` | Changing schema, data shape, dependency, framework, runtime, or infrastructure | `.acm/templates/tasks/profiles/migration.md` |
| `performance` | Improving latency, throughput, memory, bundle size, query cost, or resource usage | `.acm/templates/tasks/profiles/performance.md` |
| `security` | Fixing or improving auth, permissions, validation, secrets, trust boundaries, or data exposure | `.acm/templates/tasks/profiles/security.md` |
| `test-improvement` | Adding or improving tests without intended product behavior change | `.acm/templates/tasks/profiles/test-improvement.md` |
| `docs` | Documentation-only changes | `.acm/templates/tasks/profiles/docs.md` |
| `spike` | Research, exploration, proof of concept, or decision support | `.acm/templates/tasks/profiles/spike.md` |

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

Use:

- `.acm/templates/tasks/task.template.md` for base task structure
- `.acm/templates/tasks/verification.template.md` only when verification needs a separate artifact
- `.acm/templates/tasks/handoff.template.md` only when handoff needs a separate artifact
- `.acm/templates/tasks/profiles/[classification].md` for classification-specific attention

---

## Workflow Summary

| Classification | Workflow |
|---|---|
| `new-feature` | capture request -> research context -> draft behavior -> analyze impact -> plan -> implement -> test -> verify -> promote feature docs -> handoff |
| `change-feature` | capture change -> read current behavior -> define proposed behavior -> analyze impact -> plan -> implement -> test -> verify changed/preserved behavior -> update durable docs -> handoff |
| `bugfix` | capture report -> reproduce or state fix hypothesis -> investigate -> identify root cause -> plan minimal fix -> add regression test -> implement -> verify -> update docs if needed -> handoff |
| `refactor` | capture motivation/scope -> identify behavior to preserve -> check boundaries/conventions -> identify tests -> plan small steps -> implement -> verify preservation -> update architecture docs if needed -> handoff |
| `migration` | capture current/target state -> analyze affected data/runtime/dependencies -> plan migration and rollback -> implement incrementally -> verify compatibility/result -> update durable docs -> handoff |
| `performance` | capture metric/problem -> baseline -> identify bottleneck -> analyze correctness risk -> plan -> implement -> verify correctness -> compare before/after -> update documentation or ADR if needed -> handoff |
| `security` | capture concern/asset -> identify trust boundaries -> analyze impact -> plan remediation -> add security tests -> implement -> verify -> update security documentation or ADR if needed -> handoff |
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

Use `.acm/agent/skills/index.md` to find skill procedures.

---

## Removed Generic Skills

The following former skills were removed because their guidance is already covered by core workflow, review, or index rules:

| Removed Skill | Replacement |
|---|---|
| `implementation` | `implementation-planning` + workflow summary |
| `verification` | `.acm/agent/review-checklist.md` + workflow summary |
| `documentation-update` | `.acm/index.md` write locations + promotion rule |
| `session-handoff` | `.acm/agent/session-handoff.md` |

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
- required task state cannot be captured because expected behavior is unclear
- selected workflow conflicts with context policy, architecture docs, or ADRs
- verification required by the workflow is impossible or unreliable

For broader conflict handling, follow `.acm/agent/context-policy.md`.
