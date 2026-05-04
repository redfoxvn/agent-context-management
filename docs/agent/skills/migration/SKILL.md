# Skill: Migration

## Purpose
Plan and execute schema, data, dependency, framework, runtime, or infrastructure changes safely.

## Use When
- The task changes data shape, persistence, dependencies, runtime, framework, infrastructure, or compatibility layers.
- Rollback, compatibility, or data integrity matters.
- Multiple versions or deployment states may coexist.

## Procedure
1. Capture current state and target state.
2. Identify affected features, modules, data, runtime, dependencies, and external systems.
3. Analyze compatibility, rollback, and recovery risks.
4. Plan migration steps and rollback steps.
5. Implement incrementally when possible.
6. Verify migration result, compatibility, and rollback assumptions.
7. Update durable docs and ADRs when contracts or architecture change.

## Outputs
- Migration motivation, current-state, target-state, plan, rollback-plan, implementation-log, verification, and handoff artifacts.
- Updated architecture or feature data/API docs when durable truth changes.

## Do Not
- Do not run destructive or shared-environment migrations without explicit approval.
- Do not ignore rollback or recovery.
- Do not assume data compatibility without verification.
