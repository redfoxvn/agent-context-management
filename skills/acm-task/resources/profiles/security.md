# Task Profile: Security

Use this profile with `skills/acm-task/resources/task.template.md`.

## Purpose

Use this profile when addressing auth, permissions, validation, secrets, trust boundaries, or data exposure risks.

## Additional Required Context

Capture:
- affected asset or actor
- trust boundaries
- exposure or attack path
- remediation strategy
- security-focused verification
- residual risk after remediation

## Definition of Ready

Before implementation:
- trust boundaries are identified
- affected assets and actors are explicit
- remediation intent is clear
- verification includes negative or abuse-oriented checks when relevant
- unresolved security uncertainty is documented instead of implied safe

## Common Mistakes

Avoid:
- weakening validation or authorization during remediation
- assuming internal callers are trusted automatically
- focusing only on happy-path verification
- hiding residual risk after partial remediation
