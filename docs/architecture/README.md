# Architecture

Purpose:
Provide durable technical context for agents and developers.

Keep this directory:
- concise
- navigational
- implementation-relevant

Do not store:
- task history
- temporary investigation notes
- speculative designs unless marked as draft

## Files

| File | Purpose |
|---|---|
| source-map.md | Map product/domain concepts to code and tests |
| system-overview.md | High-level runtime and system structure |
| module-boundaries.md | Module responsibilities and dependency constraints |

## Update Rules

Update architecture docs when:
- architecture constraints change
- module ownership changes
- runtime or data flow changes
- a new stable subsystem is introduced

Do not update for:
- temporary implementation details
- task-specific notes
- local experiments
