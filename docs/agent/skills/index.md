# Agent Skills Index

## Purpose

This file is the registry for reusable tactical heuristics.

Skills are not task types. Workflows may use skills for focused reasoning or risk handling.

Do not read all skills by default.

---

## Invocation Model

Skills are tactical heuristics, not standalone workflows.

Agents should normally load skills through task classification and workflow routing rather than treating skills as independent procedures.

Expected flow:

```txt
User request
    ↓
Workflow classifies task
    ↓
Workflow selects relevant profiles and skills
    ↓
Agent loads only the tactical heuristics needed for the task
```

Direct skill invocation is allowed as an advanced manual override, but it is not the recommended default path for users or agents.

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
| `bugfix` | Diagnose a defect and define a minimal verified fix path |
| `codebase-research` | Find the smallest relevant docs/code/tests before planning |
| `decision-recording` | Record durable decisions or ADRs when needed |
| `framework-adoption` | Adopt this framework into a real repository safely and incrementally |
| `impact-analysis` | Identify affected features, modules, contracts, data, tests, and risks |
| `implementation-planning` | Convert context and impact into a safe implementation approach |
| `migration` | Plan schema, data, dependency, runtime, or infrastructure changes safely |
| `performance-optimization` | Improve performance while preserving correctness and measuring results |
| `refactor` | Improve internal structure without changing behavior |
| `requirement-analysis` | Clarify scope, actors, acceptance criteria, and ambiguity |
| `security-remediation` | Analyze and remediate auth, permission, validation, secret, or data exposure risks |
| `spike-research` | Investigate options and produce decision support |
| `test-design` | Design meaningful behavior and regression tests |

---

## Removed Generic Skills

These former skills were removed because their guidance is now covered by core workflow, review, or routing docs:

| Removed Skill | Covered By |
|---|---|
| `implementation` | `implementation-planning` + workflow summary |
| `verification` | `review-checklist.md` + workflow summary |
| `documentation-update` | `docs/index.md` write locations + promotion rule |
| `session-handoff` | `docs/agent/session-handoff.md` |

---

## Maintenance Rules

- Add a skill only if it contains non-obvious tactical heuristics.
- Do not create skills for generic engineering behavior.
- Remove or merge skills when their guidance becomes duplicated elsewhere.
- Keep skill docs concise and tactical.
- Do not store feature truth in skill docs.
