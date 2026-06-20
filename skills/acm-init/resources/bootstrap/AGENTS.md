# AGENTS.md

Bootstrap for coding agents in this repository.

This project uses Agent Context Management (ACM):

```txt
skills = how agents work   (reusable workflow from the installed ACM skill pack)
.acm/  = what this project knows   (durable, repo-specific memory)
```

This file is the always-loaded floor — it must hold even if no skill is read.
The full operating rules and skill-routing map live in the `using-acm` skill.

## The One Rule

Do not make non-trivial changes from the user request alone. Reconcile:

1. User request
2. Relevant `.acm/` project memory
3. Current source code
4. Relevant tests or verification evidence

If these conflict in a behavior-affecting way, STOP and report the conflict.

## Read Path (non-trivial tasks)

1. `.acm/index.md`
2. `.acm/project.md`
3. Relevant task, feature, architecture, decision, source, and test files
4. Relevant skills — start with `using-acm` to choose which applies

## Safety Floor

Never silently: choose between conflicting docs/code/tests when behavior, API,
data, security, auth, billing, or architecture is affected; weaken validation,
authorization, error handling, logging, type safety, or tests; remove tests
unless obsolete and documented; discard unrelated user work; or claim
verification that was not performed.

For trivial edits, use judgment and keep changes minimal.
