# Task Workflow

## Purpose

This file is the canonical source for task classification, workflows, skills, templates, and required task artifacts.

Use it after:

- `AGENTS.md`
- `docs/index.md`
- `docs/agent/context-policy.md`

---

## Mental Model

```txt
Workflow = task lifecycle
Skill    = reusable procedure inside a workflow step
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
4. Use the matching task template when available.
5. Plan before implementation.
6. Verify before completion.
7. Update durable docs only when durable truth changes.
8. Update handoff when work is incomplete, risky, long-running, or non-obvious.

Keep artifacts proportional to risk. Do not create verbose docs just to satisfy a template.

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

## Required Artifacts

| Classification | Key Artifacts |
|---|---|
| `new-feature` | request, feature-draft, impact-analysis, plan, decisions, implementation-log, verification, handoff |
| `change-feature` | request, current-behavior, proposed-behavior, impact-analysis, plan, decisions, implementation-log, verification, handoff |
| `bugfix` | report, reproduction, investigation, root-cause, plan, regression-test, implementation-log, verification, handoff |
| `refactor` | motivation, scope, constraints, behavior-preservation, plan, implementation-log, verification, handoff |
| `migration` | motivation, current-state, target-state, plan, rollback-plan, implementation-log, verification, handoff |
| `performance` | report, baseline, bottleneck-analysis, plan, implementation-log, verification, handoff |
| `security` | report, threat-analysis, plan, implementation-log, verification, handoff |
| `test-improvement` | scope, coverage-analysis, plan, implementation-log, verification, handoff |
| `docs` | scope, source-analysis, plan, implementation-log, verification, handoff |
| `spike` | question, context, plan, findings, options, recommendation, verification, handoff |

For small tasks, mark non-applicable sections as `N/A`.

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

| Classification | Skills |
|---|---|
| `new-feature` | requirement-analysis, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, decision-recording, session-handoff |
| `change-feature` | requirement-analysis, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, decision-recording, session-handoff |
| `bugfix` | bugfix, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, session-handoff |
| `refactor` | refactor, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, decision-recording, session-handoff |
| `migration` | migration, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, decision-recording, session-handoff |
| `performance` | performance-optimization, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, decision-recording, session-handoff |
| `security` | security-remediation, codebase-research, impact-analysis, implementation-planning, implementation, test-design, verification, documentation-update, decision-recording, session-handoff |
| `test-improvement` | test-design, codebase-research, impact-analysis, implementation-planning, implementation, verification, documentation-update, session-handoff |
| `docs` | documentation-update, codebase-research, impact-analysis, verification, session-handoff |
| `spike` | spike-research, codebase-research, impact-analysis, decision-recording, documentation-update, session-handoff |

Use `docs/agent/skills/index.md` to find skill procedures.

---

## Skill Usage by Phase

Use this table as recommended guidance. Do not force a skill when the phase is not relevant to the task.

| Phase | Recommended Skill |
|---|---|
| Clarify request, scope, actors, acceptance criteria | `requirement-analysis` |
| Research relevant docs, code, and tests | `codebase-research` |
| Analyze affected modules, contracts, data, tests, and risks | `impact-analysis` |
| Plan implementation or task execution | `implementation-planning` |
| Apply scoped changes | `implementation` |
| Design behavior, regression, edge-case, or security tests | `test-design` |
| Run and record checks | `verification` |
| Update task or durable docs | `documentation-update` |
| Record durable decision or ADR candidate | `decision-recording` |
| Preserve continuation state | `session-handoff` |

Use classification-specific skills for the phase that defines that task type:

| Classification | Phase | Recommended Skill |
|---|---|---|
| `bugfix` | Reproduce, investigate, root-cause, fix hypothesis | `bugfix` |
| `refactor` | Define scope, constraints, and behavior preservation | `refactor` |
| `migration` | Current/target state, compatibility, rollback | `migration` |
| `performance` | Baseline, bottleneck, optimization evidence | `performance-optimization` |
| `security` | Trust boundaries, threat analysis, remediation | `security-remediation` |
| `spike` | Research question, findings, options, recommendation | `spike-research` |

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
