# Task: Skill-Driven ACM Migration

## Status

- status: completed
- classification: migration
- related feature/module: ACM framework structure
- last updated: 2026-06-16

## Request / Goal

Migrate this repository from a copied `.acm/` workflow framework to a hybrid model where root-level `skills/` own reusable workflow and `.acm/` stores only project-specific memory.

## Scope / Non-goals

- In scope: create root `skills/` package, move reusable workflows/templates into skills, shrink `.acm/` to project memory, update bootstrap and README guidance.
- Out of scope: build a CLI, publish a plugin, or implement agent-specific package installation.

## Context / Findings

- Current `.acm/agent/` and `.acm/templates/` files describe reusable workflow rather than project-specific truth.
- Current `.acm/product/` and much of `.acm/architecture/` are placeholders, creating initialization friction.
- The desired model is: `skills = how agents work`, `.acm/ = what this project knows`.

## Plan

- Create root `skills/` documentation and core ACM workflow skills.
- Move existing tactical skills and reusable templates into `skills/`.
- Rewrite `.acm/` as minimal project memory.
- Update `AGENTS.md` and `README.md` to describe the hybrid model.
- Run reference and diff checks.

## Changes

- Added root-level `skills/` package with core ACM workflow skills and tactical skills.
- Added required YAML frontmatter to all `SKILL.md` files: `name` and `description` metadata now appear before skill content.
- Updated every skill description to follow the writing-skills convention: descriptions start with `Use when...` and describe triggering conditions.
- Moved task templates, task profiles, feature templates, and ADR template into skill resources.
- Replaced bulky `.acm/` workflow/product/architecture placeholders with minimal project memory: `.acm/index.md`, `.acm/project.md`, `.acm/config.md`, and `.acm/tasks/`.
- Updated `AGENTS.md` and `README.md` to describe the hybrid model.
- Removed stale `.acm/agent/`, `.acm/templates/`, `.acm/product/`, placeholder `.acm/architecture/`, empty `.acm/features/`, empty `.acm/decisions/`, and old adoption docs.

## Verification

- verification_status: passed

| Check | Result | Notes |
|---|---|---|
| Stale old-path reference search | passed | Search for `.acm/agent`, `.acm/templates`, `.acm/product` found only historical migration task notes |
| Skill heading coverage | passed | Search found 18 `SKILL.md` files with `# Skill:` headings |
| Skill frontmatter format | passed | Shell validation confirmed every `skills/**/SKILL.md` starts with `---`, `name:`, `description:`, `---` |
| Skill metadata RED check | failed as expected | Initial validator rejected all 18 skill descriptions because they did not start with `Use when...` |
| Skill metadata GREEN check | passed | Validator checked 18 skill files for frontmatter delimiters, hyphenated names, `Use when...` descriptions, and description length |
| Minimal `.acm/` file check | passed | `test -f .acm/index.md && test -f .acm/project.md && test -f .acm/config.md && test -f .acm/tasks/index.md` exited 0 |
| `git diff --check` | passed | No whitespace errors reported |
| Shell `rg` checks | not run | `rg` is not installed in this shell; used repository search tool instead |

## Conflicts / Ambiguity

| Source A | Source B | Conflict / Ambiguity | Impact | Resolution |
|---|---|---|---|---|
| Current repo structure | Desired hybrid model | Workflow currently lives in `.acm/agent/`; desired workflow lives in `skills/` | Requires docs and path migration | Resolved by user preference for root `skills/` |

## Decisions / Risks

- Decision: root `skills/` is the package location, per user request.
- Risk: stale references may remain in historical task docs; active instructions should be updated.

## Next Action

- Review the migration diff and decide whether to commit the branch.
