# Task Profile: New Feature

Use this profile with `skills/acm-task/resources/task.template.md`.

## Purpose

Use this profile when adding a capability that did not previously exist.

## Additional Required Context

Capture:
- user goal and actor
- expected behavior
- affected flows, modules, or contracts
- rollout or compatibility considerations
- verification strategy for the new behavior
- durable docs likely to change

## Definition of Ready

Before implementation:
- user-visible behavior is understandable
- affected boundaries and dependencies are known
- overlap with existing features is checked
- verification approach exists for the new capability
- durable docs requiring updates are identified

## Common Mistakes

Avoid:
- implementing behavior without defining expected outcomes
- duplicating an existing capability unknowingly
- coupling unrelated cleanup into the feature task
- forgetting to promote verified durable truth into feature docs
