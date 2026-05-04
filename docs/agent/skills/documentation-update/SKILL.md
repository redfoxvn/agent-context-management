# Skill: Documentation Update

## Purpose
Update the correct context layer after a task changes working state or durable truth.

## Use When
- A task creates or updates task artifacts.
- Feature behavior, API, data model, tests, architecture, product meaning, or decisions change.
- Docs need consistency fixes after code or workflow changes.

## Procedure
1. Identify the owning source of truth using `docs/index.md`.
2. Write task-specific working notes to `docs/tasks/[task-folder]/`.
3. Write current feature truth to `docs/features/[feature-name]/` only when verified or documentation-only.
4. Update architecture, product, or decision docs only when durable truth changes.
5. Update index files when adding, renaming, deprecating, or completing important artifacts.
6. Check that task docs and durable docs do not conflict.

## Outputs
- Updated task docs.
- Updated durable docs when needed.
- Updated index files.

## Do Not
- Do not put scratch notes in durable docs.
- Do not promote unverified implementation notes into feature docs.
- Do not leave stale paths or orphaned index entries.
