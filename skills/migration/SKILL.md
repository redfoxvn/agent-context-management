---
name: migration
description: Use when changing schemas, data shapes, dependencies, frameworks, runtimes, infrastructure, or documentation structure.
---

# Skill: Migration

## Use For

Plan schema, data, dependency, framework, runtime, or infrastructure changes safely.

## When NOT To Use

Do not use this skill for simple local file moves unless compatibility, rollout, data, or structure risk exists.

## Key Moves

- Capture current state and target state.
- Identify affected data, runtime, dependencies, external systems, and deployment states.
- Analyze compatibility, rollback, recovery, and data-integrity risks.
- Prefer incremental and reversible steps when possible.
- Verify migration result and compatibility assumptions.
- Update durable docs or ADRs when contracts or architecture change.

## Output

- current and target state
- migration plan
- rollback or recovery plan
- compatibility risks
- verification notes

## Compatibility Checklist

Before implementation, identify:

- current and target states
- compatibility requirements
- rollback or recovery path
- generated files or lockfiles
- data integrity or migration-order risks
- verification for both migration result and preserved behavior

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- performing irreversible changes without rollback planning
- assuming compatibility without verification
- coupling unrelated refactors into migration work
- skipping operational verification after rollout-sensitive changes

## Escalate When

- destructive or shared-environment changes are required
- rollback is unclear or impossible
- data compatibility cannot be verified
