# Skill: Migration

## Use For

Plan schema, data, dependency, framework, runtime, or infrastructure changes safely.

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

## Escalate When

- destructive or shared-environment changes are required
- rollback is unclear or impossible
- data compatibility cannot be verified
