# Agent Failure Modes

## Common failure modes

### Editing generated files

Do not manually edit generated files.

Instead, update the source schema and regenerate.

### Weakening server-side validation

Client-side validation is UX only.

Server-side validation must remain authoritative.

### Assuming docs are always newer than code

Docs describe durable intent, but may be outdated.

When docs and code conflict, surface the conflict.

### Refactoring across module boundaries too early

Prefer localized changes unless the task explicitly requires broader refactor.

### Adding tests that only verify mocks

Tests should verify observable behavior, not just implementation details.

### Ignoring backward compatibility

For public API, database, and auth changes, check compatibility requirements.
