---
name: implementation-planning
description: Use when enough context exists to turn requirements, findings, and risks into an implementation approach.
---

# Skill: Implementation Planning

## Use For

Convert context and impact understanding into a safe implementation approach.

## When NOT To Use

Do not use this skill before enough context exists to identify affected files and verification.

## Key Moves

- Define the minimal change set.
- Identify affected files, boundaries, and verification steps.
- Break risky work into smaller stages when useful.
- Record assumptions, unknowns, and rollback considerations.
- Prefer existing patterns and localized edits.

## Output

- implementation plan
- affected files/modules
- verification strategy
- risks and assumptions

## Output Contract

A safe implementation plan includes:

- in-scope work
- not-doing list
- assumptions
- likely files or modules touched
- ordered steps
- verification commands or methods
- rollback or recovery notes when risk exists

## Verification

Before reporting this work complete:

- record what evidence was inspected
- record checks that were run
- record checks that were skipped and why
- identify unresolved risks or ambiguity

## Common Mistakes

Avoid:

- planning before context is sufficient
- hiding assumptions inside implementation steps
- omitting verification commands or methods
- mixing unrelated cleanup into the plan

## Escalate When

- implementation requires broad rewrite
- architecture boundaries become unclear
- verification strategy is unreliable
