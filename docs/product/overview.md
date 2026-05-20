# Product Overview

## Purpose

This file explains the product-level mental model of the system.

It should help humans and coding agents understand:

- what the system is trying to achieve
- who the system serves
- what major problems it solves
- which domain concepts matter
- which constraints influence implementation decisions

This file exists to provide product and domain context.
It should not become a feature specification dump.

---

## Context Contract

| Field | Value |
|---|---|
| Context type | Durable product and domain context |
| Source of truth for | Product purpose, terminology, and high-level behavior |
| Read when | Planning features, reviewing UX behavior, onboarding, prioritizing tradeoffs |
| Write when | Product understanding changes materially |
| Do not use for | Detailed feature specs, implementation details, task logs |

---

## Relationship To Other Files

| File | Boundary |
|---|---|
| `docs/features/` | detailed feature behavior and accepted implementation expectations |
| `docs/architecture/` | technical structure and runtime behavior |
| `docs/decisions/` | rationale behind important tradeoffs |
| `docs/tasks/` | temporary execution history |

Use this file to explain:

- why the system exists
- how users think about the system
- what concepts matter operationally

Do not duplicate detailed requirements already maintained elsewhere.

---

## Product Summary

Template:

```md
[System name] is a [type of system] that helps [target users] achieve [goal].

The system primarily focuses on:

- [capability]
- [capability]
- [capability]
```

Example placeholder:

```md
This project provides a context operating layer for coding agents.

The system helps:

- onboard agents into repositories
- preserve operational continuity across sessions
- reduce context loss and duplicated reasoning
- standardize execution and handoff workflows
```

---

## Target Users

Document the primary users or operators.

Template:

```md
| User Type | Goals | Important Constraints |
|---|---|---|
| [role] | [goal] | [constraint] |
```

Example placeholder:

| User Type | Goals | Important Constraints |
|---|---|---|
| Developers | reliable coding assistance | low operational overhead |
| Coding agents | safe and consistent execution | limited context window |
| Reviewers | understand changes quickly | deterministic artifacts |

---

## Core Product Concepts

Document stable domain concepts agents must understand.

Template:

```md
| Concept | Meaning | Notes |
|---|---|---|
| [term] | [definition] | [important constraint] |
```

Example placeholder:

| Concept | Meaning | Notes |
|---|---|---|
| Task | execution unit for work | primary continuity boundary |
| Durable context | long-lived verified project knowledge | should outlive sessions |
| Skill | tactical heuristic package | workflow-driven, not user-driven |
| Adoption | onboarding workflow for existing repositories | treated as a first-class workflow |

---

## Product Goals

Document durable high-level goals.

Template:

```md
- [goal]
- [goal]
- [goal]
```

Example placeholder:

- Reduce context loss across coding sessions.
- Improve implementation consistency.
- Make agent execution more reviewable and deterministic.
- Support multi-session and multi-agent continuation.
- Keep the system lightweight and repo-native.

---

## Non-Goals

Document what the system intentionally does not try to solve.

This is important because agents often over-expand scope.

Example placeholder:

- Not a fully autonomous software engineer.
- Not a replacement for engineering judgment.
- Not a proprietary memory database.
- Not a runtime orchestration platform.
- Not a wiki replacement.

---

## Product Constraints

Document constraints that influence architecture and workflow.

Examples:

- coding agents have limited context windows
- repository context must remain git-friendly
- durable context should remain human-readable
- workflows should remain tool-agnostic
- onboarding should remain incremental

Template:

```md
- [constraint]
- [constraint]
```

---

## Success Signals

Document how the project informally measures success.

Example placeholder:

- agents onboard faster into repositories
- fewer repeated explanations are needed
- implementation consistency improves
- task handoff quality improves
- durable context remains maintainable over time

---

## Agent Usage

Agents should read this file when:

- planning product-impacting changes
- interpreting ambiguous requirements
- evaluating tradeoffs
- onboarding into the repository
- reasoning about terminology or intended behavior

Agents should update this file only when:

- the product direction changes materially
- core concepts evolve
- durable terminology changes
- target users or goals change significantly

Minor feature changes usually belong elsewhere.

---

## Readiness Checklist

This file is useful when:

- the product purpose is understandable quickly
- important terminology is explicit
- product goals and non-goals are visible
- implementation constraints are discoverable
- domain concepts are stable enough to guide decisions
- agents can infer why the architecture exists
