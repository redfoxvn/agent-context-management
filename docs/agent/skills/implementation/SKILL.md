# Skill: Implementation

## Purpose
Apply scoped changes while preserving architecture, safety constraints, and task intent.

## Use When
- A plan exists for non-trivial work.
- The affected files and verification strategy are known.
- The task is ready for edits.

## Inputs
- Current plan, task classification, and intended behavior change or non-behavior-change.
- Affected files, docs, tests, and verification strategy.
- Relevant architecture constraints, conventions, and safety requirements.
- Known risks, assumptions, open questions, and user work in the worktree.

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

## Completion Criteria
- Changes are scoped to the plan and follow existing conventions.
- Required safeguards, contracts, and unrelated user work are preserved.
- Tests or docs are updated when behavior or durable truth changes.
- Plan, classification, or scope changes are recorded before continuing.

## Do Not
- Do not make unrelated cleanup changes.
- Do not weaken tests or safeguards to make checks pass.
- Do not overwrite or revert unrelated user work.
- Do not silently change public contracts or durable behavior.
