# Verification

Purpose:
Record evidence that the task was checked intentionally instead of assumed correct.

Write when:
- tests, builds, lint, typecheck, manual inspection, or runtime validation are performed
- checks are skipped, blocked, or partially completed

Definition of done:
- performed checks are explicit
- commands or methods are concrete when possible
- failures and skipped checks include reasons
- residual uncertainty is visible
- verification claims match reality

| Check | Command / Method | Result | Notes |
|---|---|---|---|
| ... | ... | passed / failed / not run | ... |

## Not Verified

Purpose:
List important checks, scenarios, or environments that were intentionally not verified.

Write when:
- verification is partial
- environments or dependencies are unavailable
- risk remains after implementation

Definition of done:
- unverified areas are specific
- reason for skipping is explicit
- downstream reviewers or future agents can understand the remaining gap

Content:

- ...

## Residual Risks

Purpose:
Capture remaining correctness, compatibility, performance, operational, or security risks after verification.

Write when:
- verification cannot fully eliminate uncertainty
- rollout, migration, concurrency, or environment-specific risk remains

Definition of done:
- risks are concrete and actionable
- severity or impact is understandable
- follow-up work is identified when needed

Content:

- ...
