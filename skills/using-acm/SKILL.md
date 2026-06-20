---
name: using-acm
description: Use when starting ACM-guided work or deciding which ACM skill applies to the task at hand.
---

# Skill: Using ACM

## Overview

Agent Context Management (ACM) separates two things:

```txt
skills = how agents work
.acm/  = what this project knows
```

This skill is the entry point: it states the operating rules every ACM task
follows and routes you to the right skill for the work. It is not a workflow of
its own — it points at the workflow skills.

## When To Use

- Starting a session or a non-trivial task in an ACM repository.
- Unsure which ACM skill applies.
- Onboarding to how this skill pack fits together.

## Core Operating Rules

These hold across every ACM task:

- **Reconcile, don't assume.** Do not make non-trivial changes from the user
  request alone. Reconcile request, durable memory (`.acm/`), source, and tests.
- **Stop on behavior-affecting conflict.** If sources disagree about behavior,
  API, data, security, auth, billing, or architecture, stop and report it.
- **Surface assumptions** before acting on them.
- **Evidence before claims.** Do not report work complete, fixed, or passing
  without fresh verification run in this session.
- **Scope discipline.** Touch only what the task needs; note out-of-scope
  findings instead of fixing them silently.
- **Durable vs task memory.** Task docs record what happened; durable docs
  record what is true now. Promote only verified or accepted truth.

## Choosing a Skill

Most non-trivial work starts with `acm-task` (classify + load context) and ends
with `acm-completion`. Between those, route by situation:

| Situation / Trigger | Start with |
|---|---|
| Starting any non-trivial task | `acm-task` |
| Requirements unclear or ambiguous | `acm-task` (clarify, then stop and ask) |
| Adding or changing behavior | `acm-task` → `test-driven-development` |
| A defect, regression, or failing test | `bugfix` |
| Changing internal structure only (no behavior change) | `refactor` |
| Schema, data, dependency, runtime, or infra change | `migration` |
| Latency, throughput, memory, or bundle-size concern | `performance-optimization` |
| Auth, permissions, secrets, or data exposure | `security-remediation` |
| A change may ripple across modules or contracts | `impact-analysis` |
| Investigating options or feasibility | `spike-research` |
| Designing tests or coverage | `test-design` |
| Reviewing a change before merge | `code-review` |
| High-stakes or irreversible decision | `acm-adversarial-review` |
| Committing, branching, or save points | `git-workflow` |
| A durable fact or decision emerged | `acm-memory` (and `decision-recording` for ADRs) |
| Work is incomplete, risky, or needs handoff | `acm-handoff` |
| Reporting completion | `acm-completion` |
| Adopting ACM into a repository | `acm-init`, then `framework-adoption` |
| Output quality degrading or setting up context | `context-engineering` |
| Creating or editing a skill | `acm-skill-authoring` |

## Typical Flow

```
acm-task (classify + load context)
   → tactical skill(s) for the work type (bugfix / migration / refactor / …)
   → test-driven-development for behavior changes
   → code-review (and security/performance review when relevant)
   → acm-completion (fresh verification)
   → acm-memory (promote durable truth) / acm-handoff (if incomplete)
```

Not every task needs every skill. A trivial edit may need none.

## Resources

See `skills/index.md` for the full grouped skill list.
