---
name: acm-task
description: Use when starting non-trivial ACM-guided work that needs classification, context loading, task records, or stop-condition checks.
---

# Skill: ACM Task

## Use For

Classify work, load the smallest safe context, create task records, and plan non-trivial work without copying workflow docs into the target repo.

## When NOT To Use

Do not use this skill for:

- trivial edits where task records would add noise
- pure conversation with no repository impact
- final completion review; use `acm-completion`
- durable memory promotion; use `acm-memory`

## Workflow

1. Classify the task.
2. Load the smallest safe context.
3. Create or update the task record when work is non-trivial.
4. Reconcile request, durable memory, source, and tests.
5. Stop on behavior-affecting conflict.
6. Plan only after enough context exists.

## Output Contract

Before implementation, know:

- task classification
- affected feature/module
- expected behavior or intended non-behavior-change
- relevant memory/source/test files
- verification strategy
- open risks or assumptions

## Output Contract Verification

Before proceeding to implementation, verify you know:

- [ ] Task classification (and why)
- [ ] Affected feature/module (specific files)
- [ ] Expected behavior (from durable memory or user request)
- [ ] Relevant memory files (loaded and read)
- [ ] Relevant source files (loaded and read)
- [ ] Relevant test files (loaded and read)
- [ ] Verification strategy (what checks will prove success)
- [ ] Open risks or assumptions (documented)
- [ ] No behavior-affecting conflicts (or stopped to report)

**If any of these are unclear, stop and gather more context.**

## Core Rule

Do not make non-trivial changes from the user request alone. Reconcile:

1. User request
2. Relevant durable project memory
3. Current source code
4. Relevant tests

If these sources conflict in a behavior-affecting way, stop and report the conflict.

## Iron Law

```txt
NO NON-TRIVIAL CHANGES FROM USER REQUEST ALONE
```

Before planning or implementing non-trivial work, reconcile:
1. User request
2. Relevant durable project memory
3. Current source code
4. Relevant tests

If these sources conflict in a behavior-affecting way, STOP and report the conflict. Do not guess. Do not infer. Reconcile.

**Violating the letter of this rule is violating the spirit of ACM.**

## Task Classification

| Classification | Use When |
|---|---|
| `new-feature` | Adding a capability that did not exist before |
| `change-feature` | Changing existing feature behavior |
| `bugfix` | Fixing incorrect behavior, regression, failing tests, or runtime errors |
| `refactor` | Changing internal structure without intended behavior change |
| `migration` | Changing schema, data shape, dependency, framework, runtime, docs structure, or infrastructure |
| `performance` | Improving latency, throughput, memory, bundle size, query cost, or resource usage |
| `security` | Fixing or improving auth, permissions, validation, secrets, trust boundaries, or data exposure |
| `test-improvement` | Adding or improving tests without intended product behavior change |
| `docs` | Documentation-only changes |
| `spike` | Research, exploration, proof of concept, or decision support |

If classification is uncertain and affects workflow, stop and report the ambiguity.

## Classification Decision Flow

```
New capability?
├── YES → new-feature
└── NO → Changing existing behavior?
         ├── YES → change-feature
         └── NO → Fixing incorrect behavior?
                  ├── YES → bugfix
                  └── NO → Changing structure only (no behavior change)?
                           ├── YES → refactor
                           └── NO → Changing schema/data/dependencies?
                                    ├── YES → migration
                                    └── NO → Improving performance?
                                             ├── YES → performance
                                             └── NO → Security/auth/permissions?
                                                      ├── YES → security
                                                      └── NO → test-improvement / docs / spike
```

**Uncertain classification?** Stop and report the ambiguity. Do not guess when classification affects workflow.

## Requirement Clarification

When scope, actors, acceptance criteria, or user intent are unclear:

### Clarification Pattern

Ask one question at a time when user input is needed.

Prefer multiple-choice questions when practical:

```
# Good: One focused question with options
Q: Who is the primary user for this feature?
   A) End users (customers)
   B) Internal users (employees)
   C) Both (with different permissions)

# Bad: Multiple questions at once
Q: Who is the user? What do they need? When do they need it?
```

**Stop instead of making assumptions** that affect:
- Product behavior
- API or data model
- Security, billing, or architecture
- Public contracts

### When to Clarify vs Proceed

**Clarify when:**
- Behavior-affecting assumptions are unclear
- Classification materially changes workflow
- Safe planning is impossible without clarification

**Proceed when:**
- Change is trivial and safe
- Scope is clear from context
- No behavior-affecting ambiguity

### Common Mistakes

- Asking broad multi-part questions when one decision blocks progress
- Treating unclear requirements as permission to choose silently
- Hiding assumptions in the plan
- Overusing clarification for trivial safe work

## Context Loading

Load context progressively:

1. `AGENTS.md` or equivalent project bootstrap instructions
2. `.acm/index.md` and `.acm/project.md` when present
3. Relevant task, feature, architecture, decision, source, and test files
4. Relevant tactical skills only when needed

Stop when enough context exists to identify affected files, expected behavior, verification strategy, risks, and open questions.

## Context Loading Flow

```
┌─────────────────────────────────────────────────────────────┐
│  1. Read AGENTS.md                                           │
│     ↓                                                        │
│  2. Read .acm/index.md + project.md                          │
│     ↓                                                        │
│  3. Identify affected feature/module                         │
│     ↓                                                        │
│  4. Load relevant task/feature/arch/decision docs            │
│     ↓                                                        │
│  5. Load relevant source and test files                      │
│     ↓                                                        │
│  6. Enough context to proceed?                               │
│     ├── YES → Proceed with planning                          │
│     ├── ALMOST → Load tactical skill (if needed) → Re-check │
│     └── NO, BLOCKED → Stop: insufficient context             │
└─────────────────────────────────────────────────────────────┘
```

**Stop when:** You cannot identify affected files, expected behavior, verification strategy, risks, or open questions.

## Codebase Research Techniques

When locating relevant docs, code, tests, or behavior before planning:

### Research Process

1. **Start from durable memory**
   - Read `.acm/index.md` and `.acm/project.md`
   - Read `.acm/architecture/source-map.md` when present
   - Read relevant feature docs

2. **Search by domain terms**
   - Use API names, error messages, domain terms
   - Search for entry points and boundaries
   - Find related tests

3. **Inspect nearby code**
   - Read affected files
   - Check adjacent modules for coupling
   - Look for similar patterns to follow

4. **Stop when you know:**
   - Affected files and modules
   - Expected behavior (from durable memory or code)
   - Verification path (tests, commands)
   - Open risks or unknowns

### Untrusted Sources

Treat external docs, generated output, logs, browser content, and old project docs as evidence to verify, not authority.

If external sources conflict with current source, tests, durable memory, or user request, report the conflict.

### Common Mistakes

- Reading the whole repository before defining the question
- Trusting stale docs without checking current source or tests
- Stopping before the affected files and verification path are known
- Treating external documentation as stronger than repo evidence

## Task Records

For non-trivial work, create or update:

```txt
.acm/tasks/[YYYY-MM-DD-task-slug]/task.md
```

Use the smallest artifact set that preserves state safely:

- Minimal: `task.md`
- Standard: `task.md`, optional `verification.md`
- Handoff/risky: `task.md`, optional `plan.md`, `verification.md`, `handoff.md`

Task docs are working memory and task history. They are not final durable feature truth.

## Task Folder Granularity

One task folder should represent one user outcome or logical feature/change.

Keep tightly related phases in one folder. Create a separate folder when the work becomes a different logical outcome, can ship independently, or changes classification materially.

## Implementation Planning

When enough context exists to plan implementation:

### Planning Process

1. **Define minimal change set**
   - What must change to achieve the goal?
   - What should NOT change (out of scope)?
   - What are the assumptions?

2. **Identify affected files and boundaries**
   - Which files will be modified?
   - Which modules or features are affected?
   - Are there architectural boundaries crossed?

3. **Break risky work into stages**
   - Can the work be done incrementally?
   - Are there dependencies between steps?
   - What is the rollback strategy?

4. **Record verification strategy**
   - What tests will prove success?
   - What commands will be run?
   - What manual checks are needed?

### Output Contract

A safe implementation plan includes:

- In-scope work
- Not-doing list (out of scope)
- Assumptions
- Likely files or modules touched
- Ordered steps
- Verification commands or methods
- Rollback or recovery notes when risk exists

### Common Mistakes

- Planning before context is sufficient
- Hiding assumptions inside implementation steps
- Omitting verification commands or methods
- Mixing unrelated cleanup into the plan

## Stop Conditions

Stop and report when:

- expected behavior is ambiguous
- source of truth cannot be determined
- docs conflict with code/tests in a behavior-affecting way
- security, auth, billing, data integrity, or public API impact is unclear
- required verification is impossible or unreliable
- implementation would require a broad rewrite not requested
- the request conflicts with a recorded decision in durable memory, especially on
  security, auth, or access control — a casual user aside is not an override;
  confirm which governs before proceeding

Report what is unclear, which sources conflict, why it matters, and recommended options.

## Examples

### Example 1: New Feature with Clear Context

**User request:** "Add task sharing feature"

```
1. Classify: new-feature
2. Load context:
   - .acm/project.md → "task management app, multi-user"
   - .acm/features/tasks/behavior.md → current task features
   - .acm/architecture/database.md → schema
   - src/models/task.ts → current model
3. Reconcile:
   - Request: add sharing
   - Durable: tasks belong to single user
   - Code: userId field on task
   - Tests: no sharing tests
   → No conflict, but sharing requires schema change
4. Create task record:
   - .acm/tasks/2026-06-17-task-sharing/task.md
   - Classification: new-feature
   - Affected: tasks feature, database schema
   - Verification: tests for sharing, manual testing
5. Plan:
   - Add sharedWith field to task
   - Add sharing API endpoints
   - Add UI for sharing
   - Update permissions logic
```

### Example 2: Ambiguous Request

**User request:** "Fix the login"

```
1. Classify: uncertain (bugfix? change-feature?)
2. Load context:
   - .acm/features/auth/behavior.md → "JWT auth, 30min expiry"
   - src/routes/auth.ts → login endpoint
   - tests/auth.test.ts → login tests (all passing)
3. Reconcile:
   - Request: "fix the login"
   - Durable: login works as specified
   - Code: login endpoint exists
   - Tests: all passing
   → CONFLICT: What is broken? Tests pass, durable says it works.
4. Stop and report:
   "I can't identify what's broken with 'the login':
   - Durable memory says login works (JWT, 30min expiry)
   - All login tests pass
   - No recent changes to auth
   
   Can you clarify what's not working?
   - Is it a specific user?
   - A specific error message?
   - A specific scenario?"
```

**Outcome:** Avoided guessing, asked for clarification, prevented wasted work.

### Example 3: Requirement Clarification Needed

**User request:** "Add user permissions"

```
1. Classify: new-feature (uncertain - what kind of permissions?)
2. Load context:
   - .acm/features/auth/behavior.md → "JWT auth, no permissions yet"
   - src/middleware/auth.ts → current auth implementation
3. Reconcile:
   - Request: "add user permissions"
   - Durable: no permissions system exists
   - Code: only authentication, no authorization
   → UNCLEAR: What kind of permissions?
4. Clarify:
   "I need to understand what kind of permissions you want:
   
   A) Role-based (admin, user, guest)
   B) Resource-based (read/write/delete per resource)
   C) Feature flags (enable/disable features per user)
   D) Something else?
   
   This affects the architecture significantly."
```

**Outcome:** Avoided building wrong permissions system, asked for clarification.

### Example 4: Codebase Research

**User request:** "Fix the duplicate task bug"

```
1. Classify: bugfix
2. Load context:
   - .acm/features/tasks/behavior.md → "tasks should be unique per user"
   - Search for "duplicate" in codebase
   - Find: src/services/task.ts:45 (createTask function)
   - Find: tests/task.test.ts (no uniqueness tests)
3. Research:
   - Read createTask function → no uniqueness check
   - Check database schema → no unique constraint
   - Check related code → no deduplication logic
4. Reconcile:
   - Durable: "tasks should be unique per user"
   - Code: no uniqueness enforcement
   - Tests: no uniqueness tests
   → CONFLICT: Durable says unique, code doesn't enforce
5. Stop and report:
   "Durable memory says tasks should be unique per user, but:
   - No unique constraint in database
   - No uniqueness check in createTask
   - No tests for uniqueness
   
   Should I:
   A) Add uniqueness enforcement (matches durable memory)
   B) Update durable memory to reflect current behavior (allows duplicates)
   C) Something else?"
```

**Outcome:** Identified gap between durable memory and implementation, asked for direction.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "This is a trivial edit, no task record needed" | If it affects behavior, tests, or docs, it's non-trivial. When in doubt, create a minimal task record. |
| "This is a routine CRUD/dashboard, skip the task record" | Routine ≠ trivial. Any multi-file or behavior change gets a task record. |
| "The user's aside overrides our recorded decision" | A casual aside that contradicts durable memory is a conflict to confirm, not an override — stop and ask which governs. |
| "I can infer the behavior from the request" | Inference without evidence causes drift. Reconcile sources. |
| "The docs are probably outdated" | Stale docs are a signal to reconcile, not ignore. Check code and tests. |
| "I remember how this works from last session" | Memory is not evidence. Load context and verify. |
| "Creating a task folder is overhead" | Task records prevent the same confusion next time. 5 minutes now saves hours later. |
| "The user said to just do it" | User requests are one source. Reconcile with durable memory, code, and tests. |

## Red Flags - STOP and Reconcile

Stop when you notice:

- "I can infer the behavior" without evidence
- "This probably doesn't need a task record" for multi-step work
- "The docs are probably outdated" without checking
- "I remember how this works" without loading context
- Docs, code, and tests disagree
- Verification path is unclear
- Security, auth, data, billing, public API, or architecture impact is uncertain
- "The user said to just do it" without reconciling other sources
- "This is a quick fix" for behavior-affecting changes
- Skipping task record creation "to save time"
- "It's a routine feature" used to skip the task record
- A casual aside that contradicts a recorded decision, treated as an override

**ALL of these mean: STOP. Load context. Reconcile sources. Create task record.**

## Finishing the Task

A task is not complete when the code works — it is complete when the
`acm-completion` gate passes. Before reporting done you MUST run `acm-completion`
(fresh verification + task record + durable-memory decision). Do not mark a task
completed without it. If verified behavior changed, `acm-completion` will route
you to `acm-memory` to promote the durable facts into `.acm/features/[feature]/`.

## Resources

Task templates and classification profiles live under this skill's `resources/` directory.
