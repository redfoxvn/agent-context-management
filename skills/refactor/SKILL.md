---
name: refactor
description: Use when changing internal structure, names, boundaries, or organization without intended behavior changes.
---

# Skill: Refactor

## Use For

Improve internal structure while preserving externally observable behavior.

## When NOT To Use

Do not use this skill when behavior must change; reclassify as `change-feature`.

## Key Moves

- Define motivation, scope, and non-goals.
- Identify behavior and public contracts that must remain unchanged.
- Check relevant architecture boundaries and conventions.
- Use existing tests or add characterization coverage when risk warrants it.
- Make small incremental changes.
- Reclassify as `change-feature` if behavior must change.

## Output

- refactor scope and non-goals
- preserved behavior/contracts
- affected files/modules
- verification strategy
- architecture doc updates only when durable structure changes

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- mixing behavior changes into refactor work silently
- broad cleanup without a concrete motivation
- weakening test coverage during restructuring
- crossing module boundaries without documenting architectural impact

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "While I'm here, I'll fix this too" | Scope creep. Stay focused on the refactor goal. |
| "This code is ugly, it needs cleanup" | Ugly is not a bug. Refactor with a concrete motivation. |
| "The tests will catch any issues" | Tests verify behavior, not structure. Verify preservation manually. |
| "This is a small refactor, no need for characterization tests" | Small refactors can have subtle behavior changes. Add tests when risk warrants. |
| "I'll document the architecture changes later" | Document while context is fresh. Later becomes never. |

## Escalate When

- behavior change becomes necessary
- module boundaries are unclear
- test coverage is too weak to verify preservation
