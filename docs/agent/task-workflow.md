# Task Workflow

## Purpose

This file defines how coding agents classify tasks, select workflows, load skills, use task templates, and decide which outputs must be produced.

Use this file after reading:
- `AGENTS.md`
- `docs/index.md`
- `docs/agent/context-policy.md`

This file answers:
- what type of task this is
- which workflow to follow
- which skills to load
- which task template to use
- which artifacts to produce
- when to reclassify or stop

---

## Core Rules

For non-trivial tasks:

1. Classify the task.
2. Use `docs/agent/context-policy.md` to load the right context depth.
3. Use the workflow, skills, and template for the selected classification.
4. Plan before implementation.
5. Verify before completion.
6. Update task docs, durable docs, and handoff as required by `docs/index.md`.

Task folder creation, write locations, and promotion rules are defined in `docs/index.md`.

Do not create a full task folder for trivial edits unless the change affects behavior, architecture, API, data, security, tests, multiple files, or future maintainability.

---

## Mental Model

```txt
Workflow = task lifecycle
Skill    = reusable procedure
Template = required task artifacts
Task docs = what happened during the task
Feature docs = what is true now
```

Task workflow orchestrates skills.
Skills do not replace workflows.
Templates define artifacts.

Skill files use this path convention:

```txt
docs/agent/skills/[skill-name]/SKILL.md
```

The skill name in each workflow must match a directory under `docs/agent/skills/`.

---

## Artifact Practicality Rule

Use the selected task template, but keep artifacts proportional to task complexity.

For small non-trivial tasks:

* keep sections concise
* mark non-applicable sections as `N/A`
* do not invent unnecessary analysis

For high-risk tasks:

* fill investigation, impact, verification, and handoff in more detail

Never create verbose task docs just to satisfy the template.

---

## Task Classification

| Classification     | Use When                                                                                       |
| ------------------ | ---------------------------------------------------------------------------------------------- |
| `new-feature`      | Adding a new capability that did not exist before                                              |
| `change-feature`   | Changing existing feature behavior                                                             |
| `bugfix`           | Fixing incorrect behavior, regression, failing tests, or runtime errors                        |
| `refactor`         | Changing internal structure without intended behavior change                                   |
| `migration`        | Changing schema, data shape, dependency, framework, runtime, or infrastructure                 |
| `performance`      | Improving latency, throughput, memory, bundle size, query cost, or resource usage              |
| `security`         | Fixing or improving auth, permissions, validation, secrets, trust boundaries, or data exposure |
| `test-improvement` | Adding or improving tests without intended product behavior change                             |
| `docs`             | Documentation-only changes                                                                     |
| `spike`            | Research, exploration, proof of concept, or decision support                                   |

If classification is uncertain and affects workflow materially, stop and report the ambiguity.

---

## Workflow Index

| Classification     | Template Path                            | Primary Output                                              |
| ------------------ | ---------------------------------------- | ----------------------------------------------------------- |
| `new-feature`      | `docs/templates/tasks/new-feature/`      | New capability implemented and promoted to feature docs     |
| `change-feature`   | `docs/templates/tasks/change-feature/`   | Existing behavior changed and durable docs updated          |
| `bugfix`           | `docs/templates/tasks/bugfix/`           | Root cause fixed and regression covered                     |
| `refactor`         | `docs/templates/tasks/refactor/`         | Internal structure improved with behavior preserved         |
| `migration`        | `docs/templates/tasks/migration/`        | System/data/runtime moved safely with rollback awareness    |
| `performance`      | `docs/templates/tasks/performance/`      | Measurable performance improvement without correctness loss |
| `security`         | `docs/templates/tasks/security/`         | Risk remediated or security posture improved                |
| `test-improvement` | `docs/templates/tasks/test-improvement/` | Test coverage or reliability improved                       |
| `docs`             | `docs/templates/tasks/docs/`             | Documentation updated accurately                            |
| `spike`            | `docs/templates/tasks/spike/`            | Findings, options, and recommendation recorded              |

---

## Key Artifacts by Classification

| Classification     | Key Artifacts                                                                                                             |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| `new-feature`      | request, feature-draft, impact-analysis, plan, decisions, implementation-log, verification, handoff                       |
| `change-feature`   | request, current-behavior, proposed-behavior, impact-analysis, plan, decisions, implementation-log, verification, handoff |
| `bugfix`           | report, reproduction, investigation, root-cause, plan, regression-test, implementation-log, verification, handoff         |
| `refactor`         | motivation, scope, constraints, behavior-preservation, plan, implementation-log, verification, handoff                    |
| `migration`        | motivation, current-state, target-state, plan, rollback-plan, implementation-log, verification, handoff                   |
| `performance`      | report, baseline, bottleneck-analysis, plan, implementation-log, verification, handoff                                    |
| `security`         | report, threat-analysis, plan, implementation-log, verification, handoff                                                  |
| `test-improvement` | scope, coverage-analysis, plan, implementation-log, verification, handoff                                                 |
| `docs`             | scope, source-analysis, plan, implementation-log, verification, handoff                                                   |
| `spike`            | question, context, plan, findings, options, recommendation, verification, handoff                                         |

---

## Workflows

### `new-feature`

Use when adding a new user/system capability.

Skills:

```txt
requirement-analysis
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
decision-recording
session-handoff
```

Workflow:

1. Capture request and acceptance criteria.
2. Identify related product, architecture, and existing feature context.
3. Draft intended feature behavior.
4. Analyze affected modules, APIs, data, auth, and tests.
5. Plan implementation.
6. Implement incrementally.
7. Add or update tests.
8. Verify.
9. Promote verified behavior/API/data/test expectations to `docs/features/[feature-name]/`.
10. Update handoff.

Outputs:

* task docs using `docs/templates/tasks/new-feature/`
* feature docs if the new capability becomes durable behavior
* changelog entry for feature-visible changes
* ADR if a long-lived decision is made
* handoff for long-running, risky, incomplete, or multi-session work

---

### `change-feature`

Use when changing behavior of an existing feature.

Skills:

```txt
requirement-analysis
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
decision-recording
session-handoff
```

Workflow:

1. Capture requested change and reason.
2. Read current feature behavior/API/data/test docs.
3. Identify current behavior from docs, code, and tests.
4. Define proposed behavior.
5. Map current behavior to proposed behavior.
6. Analyze impact and regression risk.
7. Plan implementation.
8. Implement.
9. Update/add tests.
10. Verify changed and preserved behavior.
11. Update durable feature docs and changelog.
12. Update handoff.

Outputs:

* task docs using `docs/templates/tasks/change-feature/`
* updated feature behavior docs if expected behavior changed
* updated feature API/data/test docs if relevant
* changelog entry for feature-visible changes
* ADR if a long-lived decision is made
* handoff for long-running, risky, incomplete, or multi-session work

---

### `bugfix`

Use when fixing incorrect behavior, regression, failing tests, or runtime errors.

Skills:

```txt
bugfix
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
session-handoff
```

Workflow:

1. Capture bug report, expected behavior, and actual behavior.
2. Reproduce the bug, or document a scoped fix hypothesis if reproduction is not possible.
3. Investigate related behavior, code, tests, and recent tasks if regression is suspected.
4. Identify likely root cause.
5. Plan minimal fix.
6. Add or update regression test when practical.
7. Implement fix.
8. Verify the bug no longer reproduces, or verify the fix hypothesis with the best available evidence.
9. Update durable docs if expected behavior or edge cases changed.
10. Update handoff.

If the bug cannot be reproduced, document the fix hypothesis and verification strategy before implementing.

Outputs:

* task docs using `docs/templates/tasks/bugfix/`
* regression test when practical
* updated feature docs only if expected behavior or edge cases changed
* changelog entry if the fix affects feature-visible behavior
* handoff for long-running, risky, incomplete, or multi-session work

---

### `refactor`

Use when changing internal structure without intended behavior change.

Skills:

```txt
refactor
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
decision-recording
session-handoff
```

Workflow:

1. Capture motivation and scope.
2. Identify behavior that must be preserved.
3. Read architecture boundaries and conventions.
4. Identify existing tests or add characterization tests if needed.
5. Plan small behavior-preserving steps.
6. Implement incrementally.
7. Verify behavior preservation.
8. Update architecture/convention docs only if durable structure or pattern changes.
9. Update handoff.

If behavior must change, reclassify as `change-feature`.

Outputs:

* task docs using `docs/templates/tasks/refactor/`
* updated architecture/source-map/conventions docs only if durable structure changed
* updated feature docs only if existing docs were clarified, not because behavior changed
* ADR if a long-lived structural decision is made
* handoff for long-running, risky, incomplete, or multi-session work

---

### `migration`

Use when changing schema, data shape, framework, dependency, runtime, infrastructure, or compatibility layer.

Skills:

```txt
migration
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
decision-recording
session-handoff
```

Workflow:

1. Capture current state and target state.
2. Identify affected features, modules, data, runtime, and dependencies.
3. Analyze compatibility and rollback risk.
4. Plan migration steps.
5. Plan rollback or recovery.
6. Implement migration incrementally when possible.
7. Update tests and verification checks.
8. Verify compatibility and migration result.
9. Update durable docs.
10. Update handoff.

Outputs:

* task docs using `docs/templates/tasks/migration/`
* updated architecture docs if runtime, infrastructure, or technical boundaries changed
* updated feature data model/API docs if contracts or data shape changed
* ADR for major migrations
* changelog entry if feature-visible behavior changed
* handoff for long-running, risky, incomplete, or multi-session work

---

### `performance`

Use when improving latency, throughput, memory, bundle size, query cost, or resource usage.

Skills:

```txt
performance-optimization
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
decision-recording
session-handoff
```

Workflow:

1. Capture performance problem and target metric if available.
2. Establish baseline or note why baseline is unavailable.
3. Identify hot path and affected behavior.
4. Analyze correctness and regression risks.
5. Plan optimization.
6. Implement.
7. Verify correctness.
8. Compare performance before/after when possible.
9. Update durable docs if behavior, architecture, or operational assumptions changed.
10. Update handoff.

Do not trade correctness, security, or data integrity for performance unless explicitly approved.

Outputs:

* task docs using `docs/templates/tasks/performance/`
* baseline and after-change evidence when available
* updated architecture docs if runtime flow, caching, or resource assumptions changed
* updated feature docs only if expected behavior changed
* ADR if a long-lived performance tradeoff is accepted
* handoff for long-running, risky, incomplete, or multi-session work

---

### `security`

Use when fixing or improving auth, permissions, validation, secrets, trust boundaries, or data exposure.

Skills:

```txt
security-remediation
codebase-research
impact-analysis
implementation-planning
implementation
test-design
verification
documentation-update
decision-recording
session-handoff
```

Workflow:

1. Capture security concern and affected asset.
2. Identify trust boundaries, auth/permission rules, validation rules, and data exposure risk.
3. Analyze impact and exploitability at a practical remediation level.
4. Plan remediation.
5. Add or update security-focused tests when practical.
6. Implement.
7. Verify remediation and regression risk.
8. Update durable docs and decisions if the security model changed.
9. Update handoff.

Do not disclose exploit details beyond what is needed for remediation notes.

Outputs:

* task docs using `docs/templates/tasks/security/`
* updated architecture boundaries if trust boundaries changed
* updated feature behavior/API/data-model docs if security behavior changed
* ADR for long-lived security decisions
* changelog entry if user-visible behavior changed
* handoff for long-running, risky, incomplete, or multi-session work

---

### `test-improvement`

Use when adding or improving tests without intended product behavior change.

Skills:

```txt
test-design
codebase-research
impact-analysis
implementation-planning
implementation
verification
documentation-update
session-handoff
```

Workflow:

1. Identify test gap or reliability issue.
2. Read expected behavior from feature docs and existing tests.
3. Inspect implementation only as needed to write meaningful tests.
4. Plan tests to add/update.
5. Implement tests.
6. Verify tests fail/pass appropriately when possible.
7. Update feature test scenarios if expectations are clarified.
8. Update handoff.

If tests require product behavior changes, reclassify as `change-feature` or `bugfix`.

Outputs:

* task docs using `docs/templates/tasks/test-improvement/`
* updated feature test scenarios if expectations are clarified
* handoff for long-running, risky, incomplete, or multi-session work

---

### `docs`

Use for documentation-only changes.

Skills:

```txt
documentation-update
codebase-research
impact-analysis
verification
session-handoff
```

Workflow:

1. Identify owning source of truth.
2. Update docs in the correct location.
3. Check consistency with related docs/code/tests when needed.
4. Update indexes if docs were added, removed, renamed, or deprecated.
5. Verify links, paths, and terminology.
6. Update handoff if work is incomplete or part of a larger docs effort.

If documentation reveals behavior/code mismatch, stop and report or reclassify.

Outputs:

* task docs using `docs/templates/tasks/docs/` for non-trivial docs work
* updated target docs
* updated indexes if docs were added, removed, renamed, or deprecated
* handoff for long-running, risky, incomplete, or multi-session work

---

### `spike`

Use for research, exploration, proof of concept, or decision support.

Skills:

```txt
spike-research
codebase-research
impact-analysis
decision-recording
documentation-update
session-handoff
```

Workflow:

1. Define research question.
2. Gather relevant product, architecture, decision, code, and external context as needed.
3. Record findings.
4. Compare options.
5. Recommend next action.
6. Record decision candidate or ADR if appropriate.
7. Update handoff.

A spike should not silently implement production changes.

Outputs:

* task docs using `docs/templates/tasks/spike/`
* findings, options, and recommendation
* decision candidate or ADR if accepted
* updated durable docs only if the spike result becomes an approved direction
* handoff for long-running, risky, incomplete, or multi-session work

---

## Reclassification Rules

Reclassify when the actual work differs from the initial classification.

| Initial Classification | Reclassify To               | When                                                  |
| ---------------------- | --------------------------- | ----------------------------------------------------- |
| `refactor`             | `change-feature`            | Behavior must change                                  |
| `test-improvement`     | `bugfix`                    | Test reveals an actual defect                         |
| `docs`                 | `bugfix` / `change-feature` | Docs reveal code behavior is wrong or ambiguous       |
| `bugfix`               | `change-feature`            | Fix requires redefining expected behavior             |
| `new-feature`          | `change-feature`            | Feature already exists and behavior is being modified |
| `performance`          | `change-feature`            | Optimization changes user-visible behavior            |
| `migration`            | `change-feature`            | Migration changes feature behavior                    |

When reclassifying:

1. Record the reason in task docs.
2. Switch to the correct workflow.
3. Add missing artifacts from the new template if needed.
4. Re-check context using `docs/agent/context-policy.md`.

---

## Durable Documentation Rule

Use `docs/index.md` as the canonical source for write locations and promotion rules.

After verification, update durable docs if the task changes:

* feature behavior
* API/interface contracts
* data model
* test expectations
* architecture boundaries, flows, or conventions
* product/domain meaning
* long-lived decisions

Do not promote unverified task notes into durable docs unless the task is documentation-only or planning-only.

---

## Workflow Stop Conditions

Stop and report when:

* task classification is uncertain and affects workflow materially
* the task must be reclassified before continuing
* required task artifacts cannot be completed because expected behavior is unclear
* the selected workflow would violate `docs/agent/context-policy.md`, architecture docs, or existing decisions
* verification required by the workflow is impossible or unreliable

For general context/conflict stop conditions, follow `docs/agent/context-policy.md`.

---

## Completion Checklist

Before reporting completion:

* [ ] Task classification is correct.
* [ ] Required context was loaded according to `docs/agent/context-policy.md`.
* [ ] Task folder exists for non-trivial work.
* [ ] Matching task template was used when applicable.
* [ ] Plan was created before implementation.
* [ ] Changes were verified or verification gaps are documented.
* [ ] Durable docs were updated if durable truth changed.
* [ ] Handoff was updated for incomplete, risky, long-running, or multi-session work.
* [ ] No unresolved conflict remains.
