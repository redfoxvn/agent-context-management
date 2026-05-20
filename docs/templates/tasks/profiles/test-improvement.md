# Task Profile: Test Improvement

Use this profile with `docs/templates/tasks/task.template.md`.

## Purpose

Use this profile when improving or adding tests without intended product behavior changes.

## Additional Required Context

Capture:
- missing coverage or test gap
- expected behavior
- existing verification weaknesses
- added coverage and remaining gaps
- affected modules or flows

## Definition of Ready

Before implementation:
- expected behavior is grounded in docs, code, tests, or user clarification
- the coverage gap is understandable
- test scope is proportional to the risk
- remaining untested areas are acknowledged when relevant
- discovered behavior inconsistencies are recorded instead of ignored

## Common Mistakes

Avoid:
- encoding accidental implementation details as intended behavior
- adding brittle tests tightly coupled to internals
- claiming behavior correctness solely because tests pass
- silently discovering a bug but keeping the task classified incorrectly
