---
name: codebase-research
description: Use when locating relevant docs, code, tests, entry points, owners, or behavior before planning a change.
---

# Skill: Codebase Research

## Use For

Find the smallest source/test area needed to plan a change safely.

## Key Moves

- Start from `.acm/index.md`, `.acm/project.md`, and `.acm/architecture/source-map.md` when present.
- Read only relevant durable docs.
- Search by domain terms, API names, errors, and known paths.
- Inspect nearby tests before planning.
- Stop when affected files, expected behavior, verification path, and open risks are known.

## Output

- affected files
- relevant docs/tests
- current behavior summary
- conflicts or unknowns

## Escalate When

- docs/code/tests disagree
- ownership or behavior is unclear
- impact area keeps expanding
