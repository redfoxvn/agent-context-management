# Task Profile: Change Feature

Use this profile with `.acm/templates/tasks/task.template.md`.

## Purpose

Use this profile when changing behavior of an existing feature.

## Additional Required Context

Capture:
- current behavior
- proposed behavior
- behavior that must be preserved
- affected flows, contracts, data, or tests
- compatibility and regression risks
- durable docs likely to change

## Definition of Ready

Before implementation:
- current behavior is grounded in feature docs, code, tests, or user clarification
- proposed behavior is explicit
- preserved behavior is identified
- affected contracts and regression risks are known
- docs/code/tests conflicts are recorded instead of silently resolved

## Common Mistakes

Avoid:
- treating a behavior change as a refactor
- changing adjacent behavior without documenting intent
- updating code before understanding current behavior
- forgetting to update durable feature docs after verification
