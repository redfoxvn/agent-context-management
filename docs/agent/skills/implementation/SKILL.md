# Skill: Implementation

## Use For

Apply scoped changes while preserving architecture, safety constraints, and task intent.

## Key Moves

- Re-read the plan and affected files before editing.
- Prefer minimal, localized changes.
- Preserve validation, auth, permissions, logging, type safety, and tests.
- Update tests when behavior changes.
- Pause and update the plan if scope or risk changes.
- Avoid unrelated cleanup or silent contract changes.

## Output

- scoped code/docs/test changes
- implementation notes when meaningful
- updated verification targets

## Escalate When

- scope expands beyond the plan
- architecture boundaries become unclear
- implementation requires changing durable behavior unexpectedly
