# AGENTS.md

Bootstrap for coding agents working in this repository.

`.acm/` means Agent Context Management. Reusable workflow lives in root-level
`skills/`; project-specific memory lives in `.acm/`. This file is the
always-loaded floor — it must hold even if no skill is read. The full operating
rules and skill-routing map live in `skills/using-acm/SKILL.md`.

## The One Rule

Do not make non-trivial changes from the user request alone. Before planning or
implementing, reconcile:

1. User request
2. Relevant `.acm/` project memory
3. Current source code
4. Relevant tests or verification evidence

If these conflict in a behavior-affecting way, STOP and report the conflict.

Never report work done without running verification in this session and showing
the output. Create a task record for non-trivial work before reporting done.

## Read Path (non-trivial tasks)

1. `.acm/index.md`
2. `.acm/project.md`
3. Relevant task, feature, architecture, decision, source, and test files
4. Relevant skills — start with `skills/using-acm/SKILL.md` to choose which applies

Core skills: `acm-task` (classify + load context), `acm-memory` (promote durable
truth), `acm-completion` (verify before reporting done), `acm-handoff` (preserve
state), `acm-init` (set up ACM elsewhere), `acm-skill-authoring` (edit skills).

## Safety Floor

Never silently: choose between conflicting docs/code/tests when behavior, API,
data, security, auth, billing, or architecture is affected; weaken validation,
authorization, error handling, logging, type safety, or tests; remove tests
unless obsolete and documented; discard unrelated user work; or claim
verification that was not performed.

## Stop & Report

Stop when behavior is ambiguous, sources conflict in a behavior-affecting way,
the change may touch security/billing/auth/authorization/data integrity/public
API, a broad unrequested rewrite would be required, or there is no reliable way
to verify. When stopping, report: what is unclear or conflicting, which sources
conflict, why it matters, and recommended options.

For trivial edits, use judgment and keep changes minimal.
