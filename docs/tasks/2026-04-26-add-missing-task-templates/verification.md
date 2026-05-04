# Verification

## Checks
| Check | Command / Method | Result | Notes |
|---|---|---|---|
| Template directory coverage | Checked expected directories for `new-feature`, `change-feature`, `bugfix`, `refactor`, `migration`, `performance`, `security`, `test-improvement`, `docs`, and `spike`. | passed | No missing directories reported. |
| Core template coverage | Checked `plan.template.md`, `verification.template.md`, and `handoff.template.md` for `migration`, `performance`, `security`, `test-improvement`, and `spike`. | passed | No missing core templates reported. |
| Stale artifact-name check | Searched task workflow, templates, and this task for stale classification-specific plan names. | passed | No stale `*-plan` artifact references remained. |
| Template count | Counted files under the five newly added template directories. | passed | 35 template files present. |

## Consistency Review
- `docs/agent/task-workflow.md` now references template directories that exist.
- The Key Artifacts table uses `plan` consistently with `plan.template.md`.

## Not Verified
- No markdown renderer or link checker was run.
- Template content was reviewed structurally, not by executing an automated schema validator.

## Conclusion
- [x] Verified
- [ ] Not fully verified
