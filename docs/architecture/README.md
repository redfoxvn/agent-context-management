# Architecture

Purpose:
Provide durable technical context that helps agents understand system shape, stable boundaries, runtime behavior, conventions, and where to look before changing code.

This directory is a project-specific template layer. Replace placeholders with real project facts during adoption, but keep the content concise and stable.

## Files

| File | Role | Read When | Write When |
|---|---|---|---|
| `system-overview.md` | Summarizes runtime structure, major components, and system-level interactions | understanding how the system works end-to-end | runtime structure, integrations, external dependencies, or system-level constraints change |
| `source-map.md` | Maps stable product/domain areas to code and tests | locating implementation areas | modules, entry points, or test locations change |
| `module-boundaries.md` | Defines module ownership and dependency constraints | planning changes across modules | ownership, allowed dependencies, or boundary rules change |
| `flows.md` | Documents important runtime and operational flows | debugging, impact analysis, or changing runtime behavior | important flows, state transitions, or component interactions change |
| `conventions.md` | Records stable engineering conventions | implementing, refactoring, or reviewing code | accepted conventions or project-wide implementation rules change |

## What Belongs Here

- stable architecture facts
- runtime and dependency boundaries
- durable source navigation hints
- important flows that affect implementation choices
- stable engineering conventions
- external systems and integration boundaries

## What Does Not Belong Here

- task history
- temporary investigation notes
- speculative designs unless clearly marked as draft
- exhaustive file listings
- implementation logs
- detailed product requirements

## Minimum Useful Architecture Context

Before agents perform non-trivial work safely, architecture context should minimally answer:

- Which major modules or subsystems exist?
- Which runtime components interact?
- Which boundaries must not be crossed?
- Which source locations and tests are relevant?
- Which flows are operationally important?
- Which conventions should implementation follow?

A minimally useful architecture layer normally includes:

- a high-level `system-overview.md`
- a usable `source-map.md`
- module dependency or ownership guidance
- stable runtime and integration boundaries
- important runtime flows
- project-wide conventions that prevent inconsistent implementation

The goal is routing and safe reasoning, not exhaustive documentation.

---

## Architecture Context Readiness Checklist

Before considering architecture context operationally usable for agents:

- major subsystems are identifiable
- source-map entries point to real code locations
- important runtime flows are summarized
- module boundaries are understandable
- stable conventions are explicit where they matter
- stale placeholders are removed or clearly marked
- important external systems are named
- architecture docs route agents toward relevant tests or entry points

The architecture layer does not need complete system documentation.
It only needs enough stable structure to support safe onboarding and change planning.

---

## Adoption Notes

During adoption, agents should populate these files from verified repository evidence.

Use:

- `system-overview.md` for the broad runtime shape
- `source-map.md` for code navigation
- `module-boundaries.md` for ownership and dependency constraints
- `flows.md` for important runtime behavior
- `conventions.md` for stable implementation rules

Do not convert weak observations into durable rules.
If something is inferred but not verified, mark it as needing confirmation instead of presenting it as architecture truth.

---

## Update Rules

Update architecture docs when:
- architecture constraints change
- module ownership changes
- runtime or data flow changes
- a new stable subsystem is introduced
- a source map becomes stale after code movement
- a stable implementation convention changes

Do not update for:
- temporary implementation details
- task-specific notes
- local experiments
- one-off debugging findings

## Agent Usage

Before non-trivial code changes, agents should use these files to answer:

- Which part of the codebase owns this behavior?
- What boundaries must not be crossed?
- Which flows or runtime interactions are affected?
- Which conventions should the implementation follow?
- Which tests or entry points are likely relevant?
- Is this a local change or an architectural change?
