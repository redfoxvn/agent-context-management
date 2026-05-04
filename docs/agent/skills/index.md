# Agent Skills Index

## Purpose

This index lists reusable procedures that task workflows can invoke.

Skills are not task classifications. A task workflow defines the lifecycle; skills define how to perform individual steps inside that lifecycle.

## Skill File Convention

Each skill lives at:

```txt
docs/agent/skills/[skill-name]/SKILL.md
```

The skill name must match the name used in `docs/agent/task-workflow.md`.

## Skills

| Skill | Purpose |
|---|---|
| `bugfix` | Diagnose a defect and define a minimal fix path. |
| `codebase-research` | Find the smallest relevant docs/code/tests before planning changes. |
| `decision-recording` | Decide whether a durable decision or ADR is needed and record it correctly. |
| `documentation-update` | Update task, feature, architecture, product, or decision docs in the right layer. |
| `impact-analysis` | Identify affected features, modules, contracts, data, tests, and risks. |
| `implementation` | Apply scoped changes while preserving architecture and safety constraints. |
| `implementation-planning` | Convert understood requirements and impact into an actionable implementation plan. |
| `migration` | Plan and execute schema, data, dependency, runtime, or infrastructure migrations safely. |
| `performance-optimization` | Improve performance while preserving correctness and measuring results. |
| `refactor` | Improve internal structure without changing behavior. |
| `requirement-analysis` | Clarify request, scope, actors, acceptance criteria, and ambiguity. |
| `security-remediation` | Analyze and remediate auth, permission, validation, secret, or data exposure risks. |
| `session-handoff` | Preserve working state for continuation across sessions or agents. |
| `spike-research` | Investigate options and produce decision support without silently implementing. |
| `test-design` | Design meaningful tests for behavior, regressions, edge cases, and risk areas. |
| `verification` | Run and record checks without overstating what was verified. |

## Maintenance Rules

- Add a skill here when adding it to `docs/agent/task-workflow.md`.
- Remove or deprecate a skill here when removing it from workflows.
- Keep skill docs procedural and concise.
- Do not use skills as durable feature truth; use `docs/features/` for that.
