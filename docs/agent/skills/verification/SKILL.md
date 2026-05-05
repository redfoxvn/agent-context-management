# Skill: Verification

## Purpose
Run and record checks that demonstrate what was and was not verified.

## Use When
- Before reporting completion.
- After code, tests, docs, templates, or workflow changes.
- A task folder exists and verification results must be recorded.

## Inputs
- Task plan and verification strategy.
- Changed files and affected tests.
- Project scripts or documented verification commands.
- Risk level from impact analysis.
- Any prior failed checks or skipped checks.

## Procedure
1. Choose the smallest relevant checks first.
2. Prefer targeted tests before broad checks.
3. Run broader checks when risk justifies them.
4. Record command or method, result, and notes in `verification.md`.
5. If checks fail, determine whether failures are related to the task.
6. Explicitly record skipped or impossible checks and why.

## Outputs
- `verification.md` updates.
- Final response verification summary.
- Known verification gaps and residual risks.

## Completion Criteria
- Relevant checks were run, or each skipped check has a reason.
- Results are recorded with command/method, result, and notes.
- Failures are classified as related, unrelated, or unknown.
- Final response can accurately state what was and was not verified.

## Do Not
- Do not claim verification that was not performed.
- Do not run irrelevant expensive checks just to satisfy process.
- Do not hide failed or skipped checks.
