---
name: refactor
description: Use when changing internal structure, names, boundaries, or organization without intended behavior changes.
---

# Skill: Refactor

## Use For

Improve internal structure while preserving externally observable behavior.

## When NOT To Use

Do not use this skill when behavior must change; reclassify as `change-feature`.

## Key Moves

- Define motivation, scope, and non-goals.
- Identify behavior and public contracts that must remain unchanged.
- Check relevant architecture boundaries and conventions.
- Use existing tests or add characterization coverage when risk warrants it.
- Make small incremental changes.
- Reclassify as `change-feature` if behavior must change.

## Output

- refactor scope and non-goals
- preserved behavior/contracts
- affected files/modules
- verification strategy
- architecture doc updates only when durable structure changes

## Verification

Before reporting refactor complete:

### Behavior Preservation

- [ ] All existing tests pass
- [ ] Public API unchanged (or changes documented)
- [ ] Error messages unchanged (or changes documented)
- [ ] Side effects unchanged (logging, metrics, etc.)
- [ ] Manual verification of critical flows

### Code Quality

- [ ] No new code smells introduced
- [ ] Test coverage maintained or improved
- [ ] No performance regression
- [ ] Cyclomatic complexity reduced (if that was the goal)

### Documentation

- [ ] Architecture docs updated if structure changed
- [ ] Inline comments updated if logic moved
- [ ] No stale references to old structure
- [ ] ADR created if architectural boundary changed

### Evidence

- [ ] Test output recorded (before and after)
- [ ] Before/after comparison if applicable
- [ ] Performance metrics compared (if performance-sensitive)
- [ ] Residual risks documented

## Common Mistakes

Avoid:

- mixing behavior changes into refactor work silently
- broad cleanup without a concrete motivation
- weakening test coverage during restructuring
- crossing module boundaries without documenting architectural impact

## Examples

### Example 1: Extract Validation Logic

**Scenario:** User requests "extract validation logic to shared utility"

**Without ACM:**
```
Agent: <extracts validation, breaks 3 tests, doesn't notice>
```

**With ACM:**
```
1. Classify: refactor (no behavior change intended)
2. Load context:
   - .acm/architecture/validation.md → "validation at API boundaries"
   - src/routes/users.ts → inline validation (lines 45-60)
   - src/routes/tasks.ts → inline validation (lines 30-45)
   - tests/users.test.ts, tests/tasks.test.ts → existing tests
3. Define preserved behavior:
   - User validation: email required, name 2-50 chars
   - Task validation: title required, status enum
   - Error format: { code: 'VALIDATION_ERROR', message: string }
4. Add characterization tests (if missing):
   - Test user validation edge cases
   - Test task validation edge cases
   - Verify error format
5. Extract:
   - Create src/lib/validation.ts
   - Move user validation logic
   - Move task validation logic
   - Update routes to use shared utility
6. Verify:
   - Run all tests → pass
   - Check error format unchanged
   - Check validation behavior unchanged
7. Update durable memory:
   - .acm/architecture/validation.md → add shared utility location
```

**Outcome:** Validation extracted, behavior preserved, architecture doc updated.

### Example 2: Scope Creep Prevention

**Scenario:** User requests "refactor auth module"

**Without ACM:**
```
Agent: <refactors auth, also "fixes" logging, also updates error messages>
```

**With ACM:**
```
1. Classify: refactor
2. Load context:
   - .acm/features/auth/behavior.md → "JWT auth, 30min expiry"
   - src/middleware/auth.ts → current implementation
3. Define scope:
   - Motivation: "auth module is 500 lines, hard to test"
   - Goal: "extract token validation to separate function"
   - Non-goals: "don't change logging, error messages, or token format"
4. Notice during refactor:
   - Logging is inconsistent (but out of scope)
   - Error messages could be clearer (but out of scope)
5. Stay focused:
   - Extract token validation only
   - Note other issues in task record: "NOTICED BUT NOT TOUCHING:
     - Logging inconsistency (separate task)
     - Error message clarity (separate task)"
6. Verify:
   - Auth behavior unchanged
   - Tests pass
```

**Outcome:** Refactor completed, scope discipline maintained, other issues noted for future tasks.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "While I'm here, I'll fix this too" | Scope creep. Stay focused on the refactor goal. |
| "This code is ugly, it needs cleanup" | Ugly is not a bug. Refactor with a concrete motivation. |
| "The tests will catch any issues" | Tests verify behavior, not structure. Verify preservation manually. |
| "This is a small refactor, no need for characterization tests" | Small refactors can have subtle behavior changes. Add tests when risk warrants. |
| "I'll document the architecture changes later" | Document while context is fresh. Later becomes never. |

## Escalate When

- behavior change becomes necessary
- module boundaries are unclear
- test coverage is too weak to verify preservation

## Related Skills

- **acm-task**: Classify as refactor, load context before refactoring
- **acm-memory**: Promote architecture changes to durable memory
- **test-driven-development**: Use characterization tests to verify behavior preservation
- **code-review**: Ensure architecture axis reviewed
- **acm-adversarial-review**: Use for high-stakes refactors (core modules, public APIs)
