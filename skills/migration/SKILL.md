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

Before reporting migration complete:

### Compatibility

- [ ] Current and target states documented
- [ ] Compatibility requirements identified
- [ ] Compatibility assumptions tested, not inferred
- [ ] Breaking changes documented

### Data Integrity

- [ ] Data migration tested with representative data when applicable
- [ ] No data loss or corruption observed
- [ ] Post-migration validation performed
- [ ] Generated files and lockfiles checked when applicable

### Rollback

- [ ] Rollback or recovery plan documented
- [ ] Rollback tested or inability to test documented
- [ ] Rollback triggers defined
- [ ] Irreversible steps explicitly called out

### Result Verification

- [ ] Migration result verified
- [ ] Preserved behavior verified
- [ ] Performance not degraded in relevant paths
- [ ] Security controls not weakened

### Documentation

- [ ] Migration notes recorded in task state
- [ ] Durable memory updated for schema, runtime, dependency, or architecture changes
- [ ] ADR created if the migration reflects a durable tradeoff
- [ ] Residual risks documented

## Common Mistakes

Avoid:

- performing irreversible changes without rollback planning
- assuming compatibility without verification
- coupling unrelated refactors into migration work
- skipping operational verification after rollout-sensitive changes

## Examples

### Example 1: Database Schema Migration

**Scenario:** User requests "add priority field to tasks table"

**Without ACM:**
```
Agent: <adds column, updates code, doesn't test rollback>
```

**With ACM:**
```
1. Classify: migration (schema change)
2. Load context:
   - .acm/architecture/database.md → "PostgreSQL, Prisma ORM"
   - .acm/features/tasks/api.md → current task schema
   - prisma/schema.prisma → current model
   - tests/tasks.test.ts → existing tests
3. Capture current state:
   - Task model: id, title, status, createdAt, updatedAt
   - No priority field
4. Define target state:
   - Task model: id, title, status, priority, createdAt, updatedAt
   - priority: enum('low', 'medium', 'high'), default 'medium'
5. Plan migration:
   - Add column with default value (non-breaking)
   - Update Prisma schema
   - Generate migration
   - Update API types
   - Add tests for priority field
6. Plan rollback:
   - Migration is additive (can drop column)
   - No data transformation needed
   - Rollback: drop column, revert schema
7. Verify:
   - Run migration locally → success
   - Run tests → pass
   - Test rollback → success
   - Check API accepts priority field
8. Update durable memory:
   - .acm/features/tasks/api.md → add priority field
   - .acm/architecture/database.md → note migration pattern
```

**Outcome:** Schema migrated, rollback tested, durable memory updated.

### Example 2: Dependency Update with Breaking Changes

**Scenario:** User requests "update React from 17 to 18"

**Without ACM:**
```
Agent: <updates package.json, fixes compilation errors, ships>
```

**With ACM:**
```
1. Classify: migration (dependency update)
2. Load context:
   - .acm/architecture/frontend.md → "React 17, TypeScript"
   - package.json → current dependencies
   - React 18 migration guide → breaking changes
3. Identify breaking changes:
   - ReactDOM.render → createRoot
   - Automatic batching (may affect tests)
   - Strict Mode double-invokes effects
4. Compatibility analysis:
   - 15 components use ReactDOM.render
   - 3 tests rely on effect timing
   - No concurrent features used
5. Plan incremental migration:
   - Phase 1: Update to React 18, keep ReactDOM.render (deprecated but works)
   - Phase 2: Migrate to createRoot (one component at a time)
   - Phase 3: Fix effect timing tests
   - Phase 4: Enable Strict Mode
6. Rollback plan:
   - Revert package.json
   - Revert code changes
   - No data migration needed
7. Verify each phase:
   - Phase 1: Build succeeds, tests pass
   - Phase 2: Each component migration tested
   - Phase 3: Tests updated and passing
   - Phase 4: No new issues in Strict Mode
8. Update durable memory:
   - .acm/architecture/frontend.md → React 18
   - .acm/decisions/2026-06-17-react-18-migration.md → rationale
```

**Outcome:** Dependency updated incrementally, breaking changes handled, decision recorded.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "The migration is reversible" | Verify that assumption. Some migrations have hidden irreversibility. |
| "Compatibility is not an issue" | Test it. Assumptions about compatibility are often wrong. |
| "We'll handle rollback if needed" | Plan rollback before implementation, not after failure. |
| "This is just a dependency update" | Dependency updates can break APIs, data shapes, or runtime behavior. |
| "The data will migrate fine" | Test with real data. Synthetic data misses edge cases. |

## Related Skills

- **acm-task**: Classify as migration and load context before planning
- **acm-memory**: Promote schema, runtime, dependency, or architecture changes
- **test-driven-development**: Write migration and compatibility tests first when practical
- **code-review**: Review migration plan, rollback, and risk boundaries
- **acm-adversarial-review**: Use for high-stakes migrations involving production data or public APIs

## Escalate When

- destructive or shared-environment changes are required
- rollback is unclear or impossible
- data compatibility cannot be verified
