# Skill: Implementation

## Purpose
Apply scoped changes while preserving architecture, safety constraints, and task intent.

## Use When
- A plan exists for non-trivial work.
- The affected files and verification strategy are known.
- The task is ready for edits.

## Procedure
1. Re-read the current plan and affected files before editing.
2. Make minimal, localized changes that follow existing conventions.
3. Preserve validation, auth, permissions, error handling, logging, type safety, and tests.
4. Update or add tests when behavior changes.
5. Update task docs as meaningful implementation steps are completed.
6. Pause and update the plan if scope, risk, or classification changes.

## Outputs
- Source, test, or docs changes scoped to the task.
- `implementation-log.md` updates when a task folder exists.

## Do Not
- Do not make unrelated cleanup changes.
- Do not weaken tests or safeguards to make checks pass.
- Do not overwrite or revert unrelated user work.
- Do not silently change public contracts or durable behavior.
