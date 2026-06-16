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

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- analyzing only the file being edited
- ignoring shared contracts or generated files
- treating unknown coupling as no coupling
- expanding scope without updating the task record

## Escalate When

- impact crosses architectural boundaries
- compatibility or migration risk is unclear
- hidden coupling keeps expanding scope
