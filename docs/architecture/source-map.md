# Source Map

Purpose:
Help agents quickly locate the correct implementation areas without scanning the entire repository.

Keep mappings coarse-grained, stable, and navigation-oriented.

## Mapping

| Product / Domain Area | Main Modules | Entry Points | Key Files / Directories | Tests |
|---|---|---|---|---|
| `[example-domain-area]` | `apps/api` | `api/routes/...` | `services/...` | `tests/...` |

## Rules

- Prefer stable directories or modules over individual files.
- Avoid listing every implementation file.
- Update existing mappings instead of creating near-duplicates.
- Remove stale mappings after major refactors.

## Agent Usage

Agents should read this file when:
- locating the owner of a behavior
- planning impact analysis
- searching for related tests
- onboarding into an unfamiliar codebase area

Agents should update this file when:
- modules move
- ownership changes
- stable entry points change
- a new long-lived subsystem is introduced
