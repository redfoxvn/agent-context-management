# Task Profile: Refactor

Use this profile with `.acm/templates/tasks/task.template.md`.

## Purpose

Use this profile when improving internal structure without intended behavior changes.

## Additional Required Context

Capture:
- refactor motivation
- scope and explicit non-goals
- preserved behavior and contracts
- affected architecture boundaries
- verification coverage for preserved behavior

## Definition of Ready

Before implementation:
- preserved behavior is identified
- affected boundaries and dependencies are understood
- verification exists for behavior preservation
- scope is constrained to the refactor intent
- behavior changes are treated as reclassification triggers

## Common Mistakes

Avoid:
- mixing behavior changes into refactor work silently
- broad cleanup without clear motivation
- weakening test coverage during restructuring
- crossing module boundaries without documenting architectural impact
