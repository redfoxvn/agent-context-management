# Architecture

Purpose:
Provide durable technical context that helps agents understand system shape, stable boundaries, and where to look before changing code.

This directory is a project-specific template layer. Replace placeholders with real project facts during adoption, but keep the content concise and stable.

## Files

| File | Role | Read When | Write When |
|---|---|---|---|
| `source-map.md` | Maps stable product/domain areas to code and tests | locating implementation areas | modules, entry points, or test locations change |
| `system-overview.md` | Summarizes runtime structure, major components, and important flows | understanding how the system works end-to-end | runtime structure, integrations, or major flows change |
| `module-boundaries.md` | Defines module ownership and dependency constraints | planning changes across modules | ownership, allowed dependencies, or boundary rules change |

## What Belongs Here

- stable architecture facts
- runtime and dependency boundaries
- durable source navigation hints
- major flows that affect implementation choices

## What Does Not Belong Here

- task history
- temporary investigation notes
- speculative designs unless clearly marked as draft
- exhaustive file listings
- implementation logs

## Update Rules

Update architecture docs when:
- architecture constraints change
- module ownership changes
- runtime or data flow changes
- a new stable subsystem is introduced
- a source map becomes stale after code movement

Do not update for:
- temporary implementation details
- task-specific notes
- local experiments
- one-off debugging findings

## Agent Usage

Before non-trivial code changes, agents should use these files to answer:

- Which part of the codebase owns this behavior?
- What boundaries must not be crossed?
- Which tests or entry points are likely relevant?
- Is this a local change or an architectural change?
