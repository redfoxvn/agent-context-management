---
name: impact-analysis
description: Use when a change may affect multiple features, modules, contracts, data, tests, APIs, or operational risks.
---

# Skill: Impact Analysis

## Use For

Identify affected behavior, modules, contracts, tests, and risk before implementation.

## When NOT To Use

Do not use this skill for trivial local edits with no external behavior or dependency impact.

## Key Moves

- Trace affected features, APIs, data models, and dependencies.
- Identify behavior that must change vs behavior that must remain stable.
- Inspect adjacent modules and shared contracts when coupling exists.
- Identify verification scope and regression risk.
- Keep analysis proportional to task risk.

## Output

- affected modules/files
- risk summary
- verification scope
- dependency or compatibility concerns

## Affected Surface Checklist

Check whether the change touches:

- feature behavior
- public or internal APIs
- data models or persistence
- auth, permissions, or validation
- background jobs or integrations
- tests, fixtures, or generated artifacts
- deployment, migration, or rollback paths

## Verification

Before reporting impact analysis complete:

### Surface Area

- [ ] Affected features, modules, files, and contracts identified
- [ ] Public APIs, internal APIs, and data models checked where relevant
- [ ] Auth, permissions, validation, and security boundaries checked where relevant
- [ ] Generated artifacts, fixtures, migrations, and deployment paths considered

### Behavior

- [ ] Behavior that must change is documented
- [ ] Behavior that must remain stable is documented
- [ ] Adjacent modules and shared contracts inspected when coupling exists
- [ ] Unknown coupling called out instead of treated as no risk

### Verification Scope

- [ ] Required tests or checks identified for each affected surface
- [ ] Regression risks prioritized by impact
- [ ] Manual checks identified where automation is weak
- [ ] Out-of-scope areas documented

### Evidence

- [ ] Evidence inspected is recorded
- [ ] Checks run are recorded when analysis includes verification
- [ ] Skipped checks are recorded with reasons
- [ ] Residual risks or ambiguity documented

## Common Mistakes

Avoid:

- analyzing only the file being edited
- ignoring shared contracts or generated files
- treating unknown coupling as no coupling
- expanding scope without updating the task record

## Example: Adding a Field to a Shared Response

**Change:** add an `archived` flag to the Task API response.

```
1. Classify: change-feature (touches a shared contract)
2. Trace affected surface:
   - API: GET /tasks, GET /tasks/:id (serializer)
   - Consumers: web client, mobile client, CSV export job
   - Data: tasks table (new column + default)
   - Tests: serializer tests, export-job snapshot tests
3. Must change vs must stay stable:
   - change: serializer includes `archived`
   - stable: existing fields, ordering, and types (clients already depend on them)
4. Verification scope:
   - serializer unit tests; update export snapshot; mobile contract check
   - migration adds column with a safe default (non-breaking)
5. Out of scope: archive UI (separate task)
```

**Outcome:** Surfaced three consumers and a migration that the "one-line" serializer change would otherwise have broken.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "It's a one-file change, impact is local" | Shared contracts and callers turn one-file changes system-wide. Trace the callers. |
| "Nothing else uses this" | "I didn't find a user" is not "there is no user." Search, don't assume. |
| "The tests will catch anything I miss" | Tests only catch what they cover. Weak automation needs explicit manual scope. |
| "Unknown coupling is probably fine" | Unknown coupling is unbounded risk. Call it out; don't treat it as no risk. |

## Red Flags - STOP and Widen the Trace

Stop when you notice:

- Analyzing only the file being edited
- Concluding "nothing else uses this" without searching callers and contracts
- Treating unknown coupling as no coupling
- Skipping generated artifacts, fixtures, or migration/rollback paths
- Scope expanding during analysis without updating the task record

**ALL of these mean: STOP. Trace callers and shared contracts. Document what must stay stable.**

## Related Skills

- **acm-task**: Load context and record task scope before analysis
- **context-engineering**: Keep broad impact context manageable
- **migration**: Use when impact includes schema, runtime, dependency, or infrastructure changes
- **security-remediation**: Use when impact touches trust boundaries or sensitive data
- **code-review**: Use impact findings to focus review axes

## Stop Conditions

- impact crosses architectural boundaries
- compatibility or migration risk is unclear
- hidden coupling keeps expanding scope
