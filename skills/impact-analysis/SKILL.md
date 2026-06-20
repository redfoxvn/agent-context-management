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

## Related Skills

- **acm-task**: Load context and record task scope before analysis
- **context-engineering**: Keep broad impact context manageable
- **migration**: Use when impact includes schema, runtime, dependency, or infrastructure changes
- **security-remediation**: Use when impact touches trust boundaries or sensitive data
- **code-review**: Use impact findings to focus review axes

## Escalate When

- impact crosses architectural boundaries
- compatibility or migration risk is unclear
- hidden coupling keeps expanding scope
