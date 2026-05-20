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

## Minimum Useful Architecture Context

Before agents perform non-trivial work safely, architecture context should minimally answer:

- Which major modules or subsystems exist?
- Which runtime components interact?
- Which boundaries must not be crossed?
- Which source locations and tests are relevant?
- Which flows are operationally important?

A minimally useful architecture layer normally includes:

- a usable `source-map.md`
- a high-level `system-overview.md`
- module dependency or ownership guidance
- stable runtime and integration boundaries

The goal is routing and safe reasoning, not exhaustive documentation.

---

## Architecture Context Readiness Checklist

Before considering architecture context operationally usable for agents:

- major subsystems are identifiable
- source-map entries point to real code locations
- important runtime flows are summarized
- module boundaries are understandable
- stale placeholders are removed or clearly marked
- important external systems are named
- architecture docs route agents toward relevant tests or entry points

The architecture layer does not need complete system documentation.
It only needs enough stable structure to support safe onboarding and change planning.

---

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
