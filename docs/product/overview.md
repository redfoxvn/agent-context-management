# Product Overview

Purpose:
Provide the high-level product mental model so agents understand what the system is, who it serves, and what outcomes it optimizes for.

This file should explain product intent, not feature details or implementation design.

Use this file to answer:

- What is this product or system?
- Who uses or operates it?
- What problems does it solve?
- What goals and non-goals shape implementation decisions?

---

## Relationship To Product Files

| File | Role |
|---|---|
| `overview.md` | High-level product purpose, users, goals, and non-goals |
| `glossary.md` | Canonical terminology |
| `domain-model.md` | Core entities, relationships, and lifecycle |
| `business-rules.md` | Stable behavioral constraints and policies |

Keep this file broad and concise.
Put detailed terminology, entities, and rules in the more specific product files.

---

## Summary

```md
[System name] is a [type of system] that helps [target users] achieve [goal].

It primarily focuses on:

- [capability]
- [capability]
- [capability]
```

Example:

```md
This project provides a repo-native context management layer for coding agents.

It primarily focuses on:

- helping agents onboard into repositories
- preserving operational continuity across sessions
- reducing context loss and duplicated reasoning
- standardizing task execution and handoff workflows
```

---

## Users / Operators

| User Type | Goals | Constraints |
|---|---|---|
| `[user-or-operator]` | `[what they need to accomplish]` | `[important limitation or concern]` |

---

## Core Product Concepts

| Concept | Meaning | Notes |
|---|---|---|
| `[concept]` | `[short definition]` | `[important constraint or distinction]` |

Examples:

| Concept | Meaning | Notes |
|---|---|---|
| Task | execution unit for work | primary continuity boundary |
| Durable context | verified long-lived project knowledge | should outlive sessions |
| Skill | tactical heuristic package | workflow-driven, not user-driven |
| Adoption | onboarding workflow for existing repositories | treated as a first-class task |

Move detailed terminology to `glossary.md` when this section grows too large.

---

## Goals

- `[durable product goal]`
- `[durable product goal]`
- `[durable product goal]`

Examples:

- Reduce context loss across coding sessions.
- Improve implementation consistency.
- Make agent work more reviewable and deterministic.
- Support multi-session and multi-agent continuation.
- Keep the system lightweight, repo-native, and human-readable.

---

## Non-Goals

Use this section to prevent scope creep.

- `[thing the product intentionally does not try to solve]`
- `[thing the product intentionally does not try to solve]`

Examples:

- Not a fully autonomous software engineer.
- Not a replacement for engineering judgment.
- Not a proprietary memory database.
- Not a runtime orchestration platform.
- Not a wiki replacement.

---

## Product Constraints

- `[constraint that affects product or technical decisions]`
- `[constraint that affects product or technical decisions]`

Examples:

- Coding agents have limited context windows.
- Context must remain git-friendly and reviewable.
- Durable context should remain human-readable.
- Workflows should remain tool-agnostic.
- Adoption should remain incremental.

---

## What Belongs Here

- product purpose
- target users or operators
- high-level product goals
- non-goals and scope boundaries
- stable product concepts
- product constraints that affect implementation tradeoffs

## What Does Not Belong Here

- detailed feature specs
- implementation details
- API payload details
- task history
- temporary product discussions
- low-level architecture design

---

## Agent Usage

Agents should read this file when:

- onboarding into the product
- planning behavior or feature changes
- interpreting ambiguous requirements
- evaluating product/technical tradeoffs
- checking whether a change matches product intent

Agents should update this file when:

- product direction changes materially
- target users or operators change
- core product concepts change
- goals, non-goals, or constraints change

Do not update this file for minor implementation changes or task-local findings.
