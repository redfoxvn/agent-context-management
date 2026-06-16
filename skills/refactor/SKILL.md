---
name: refactor
description: Use when changing internal structure, names, boundaries, or organization without intended behavior changes.
---

# Skill: Refactor

## Use For

Improve internal structure while preserving externally observable behavior.

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

## Escalate When

- behavior change becomes necessary
- module boundaries are unclear
- test coverage is too weak to verify preservation
