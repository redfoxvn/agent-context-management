---
name: test-driven-development
description: Use when implementing any feature or bugfix, before writing implementation code.
---

# Skill: Test-Driven Development

## Use For

Write failing tests before implementation code. Prove behavior works before claiming it works.

## When NOT To Use

Do not use this skill for:
- Trivial changes (typo fixes, formatting)
- Exploratory prototyping (but delete prototype and restart with TDD)
- Generated code or configuration files

## Iron Law

```txt
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

Write code before the test? Delete it. Start over.

**Violating the letter of this rule is violating the spirit of TDD.**

## The Red-Green-Refactor Cycle

```
RED ──→ GREEN ──→ REFACTOR
 │         │          │
 │         │          └─ Clean up (keep tests passing)
 │         └─ Make it pass (minimal code)
 └─ Write failing test (prove it fails)
```

### Step 1: RED - Write Failing Test

Write one test showing expected behavior.

```typescript
// RED: This test fails because createTask doesn't exist yet
test('creates a task with title and default status', async () => {
  const task = await createTask({ title: 'Buy groceries' });
  
  expect(task.id).toBeDefined();
  expect(task.title).toBe('Buy groceries');
  expect(task.status).toBe('pending');
});
```

**Requirements:**
- Test must fail (not error)
- Failure must be because feature missing (not typos)
- One behavior per test

### Step 2: Verify RED - Watch It Fail

**MANDATORY. Never skip.**

```bash
npm test path/to/test.test.ts
```

Confirm:
- Test fails (not errors)
- Failure message is expected
- Fails because feature missing

**Test passes?** You're testing existing behavior. Fix test.

### Step 3: GREEN - Make It Pass

Write simplest code to pass the test.

```typescript
// GREEN: Minimal implementation
export async function createTask(input: { title: string }) {
  return {
    id: generateId(),
    title: input.title,
    status: 'pending',
    createdAt: new Date(),
  };
}
```

**Don't:**
- Add features beyond the test
- Refactor other code
- Optimize prematurely

### Step 4: Verify GREEN - Watch It Pass

**MANDATORY.**

```bash
npm test path/to/test.test.ts
```

Confirm:
- Test passes
- Other tests still pass
- No warnings or errors

### Step 5: REFACTOR - Clean Up

With tests green, improve code:
- Remove duplication
- Improve names
- Extract helpers

**Keep tests green. Don't add behavior.**

### Step 6: Repeat

Next failing test for next behavior.

## The Prove-It Pattern (Bug Fixes)

When a bug is reported:

```
Bug report
    ↓
Write test reproducing bug (RED)
    ↓
Test FAILS (bug confirmed)
    ↓
Implement fix (GREEN)
    ↓
Test PASSES (bug fixed)
    ↓
Run full suite (no regressions)
```

**Example:**

```typescript
// Bug: "Empty email accepted"

// RED: Write reproduction test
test('rejects empty email', async () => {
  const result = await submitForm({ email: '' });
  expect(result.error).toBe('Email required');
});

// Verify RED
// $ npm test
// FAIL: expected 'Email required', got undefined

// GREEN: Implement fix
function submitForm(data: FormData) {
  if (!data.email?.trim()) {
    return { error: 'Email required' };
  }
  // ...
}

// Verify GREEN
// $ npm test
// PASS
```

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "Too simple to test" | Simple code breaks. Test takes 30 seconds. |
| "I'll test after" | Tests passing immediately prove nothing. |
| "Tests slow me down" | TDD faster than debugging. |
| "I already manually tested" | Manual doesn't persist. Tomorrow's change breaks it. |
| "Deleting X hours of work is wasteful" | Sunk cost fallacy. Keeping unverified code is technical debt. |
| "TDD is dogmatic, I'm being pragmatic" | TDD IS pragmatic. Finds bugs before commit. |
| "Tests after achieve same goals" | Tests-after = "what does this do?" Tests-first = "what should this do?" |

## Red Flags - STOP and Start Over

- Code before test
- Test after implementation
- Test passes immediately
- Can't explain why test failed
- "Just this once" rationalization
- "I already manually tested it"
- "Keep as reference" or "adapt existing code"

**ALL of these mean: Delete code. Start over with TDD.**

## Verification Checklist

Before marking work complete:

- [ ] Every new function/method has a test
- [ ] Watched each test fail before implementing
- [ ] Each test failed for expected reason
- [ ] Wrote minimal code to pass each test
- [ ] All tests pass
- [ ] No warnings or errors
- [ ] Tests use real code (mocks only if unavoidable)
- [ ] Edge cases and errors covered

## Related Skills

- **bugfix**: Use Prove-It pattern for bug fixes
- **acm-task**: Classify work before starting TDD
- **acm-completion**: Verify all tests pass before completion

## Resources

For testing anti-patterns and advanced patterns, see Superpowers TDD skill.
