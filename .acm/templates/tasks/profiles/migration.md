# Task Profile: Migration

Use this profile with `.acm/templates/tasks/task.template.md`.

## Purpose

Use this profile for schema, dependency, runtime, infrastructure, framework, or data-shape migrations.

## Additional Required Context

Capture:
- current and target state
- compatibility constraints
- rollout sequencing
- rollback or recovery path
- operational and verification risks
- affected contracts, environments, or data flows

## Definition of Ready

Before implementation:
- current and target states are explicit
- compatibility and rollback implications are understood
- rollout sequencing is identified
- verification strategy covers migration correctness and recovery
- risky assumptions are documented instead of implied

## Common Mistakes

Avoid:
- performing irreversible changes without rollback planning
- assuming compatibility without verification
- coupling unrelated refactors into migration work
- skipping operational verification after rollout-sensitive changes
