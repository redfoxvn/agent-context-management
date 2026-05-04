# Agent Skills Index

## Purpose

This file is the registry for reusable agent procedures.

Skills are not task types. Workflows call skills for specific steps.

---

## Convention

Each skill lives at:

```txt
docs/agent/skills/[skill-name]/SKILL.md
```

Skill names must match the names used in `docs/agent/task-workflow.md`.

---

## Skills

| Skill | Purpose |
|---|---|
| `bugfix` | Diagnose a defect and define a minimal fix path |
| `codebase-research` | Find the smallest relevant docs/code/tests before planning |
| `decision-recording` | Record durable decisions or ADRs when needed |
| `documentation-update` | Update the correct task or durable documentation layer |
| `impact-analysis` | Identify affected features, modules, contracts, data, tests, and risks |
| `implementation` | Apply scoped changes while preserving architecture and safety constraints |
| `implementation-planning` | Convert context and impact into an actionable implementation plan |
| `migration` | Plan and execute schema, data, dependency, runtime, or infrastructure migrations safely |
| `performance-optimization` | Improve performance while preserving correctness and measuring results |
| `refactor` | Improve internal structure without changing behavior |
| `requirement-analysis` | Clarify request, scope, actors, acceptance criteria, and ambiguity |
| `security-remediation` | Analyze and remediate auth, permission, validation, secret, or data exposure risks |
| `session-handoff` | Preserve working state for continuation |
| `spike-research` | Investigate options and produce decision support |
| `test-design` | Design meaningful behavior and regression tests |
| `verification` | Run and record checks without overstating certainty |

---

## Maintenance Rules

- Add a skill here when adding it to `docs/agent/task-workflow.md`.
- Remove or deprecate a skill here when removing it from workflows.
- Keep skill docs procedural and concise.
- Do not store feature truth in skill docs.
