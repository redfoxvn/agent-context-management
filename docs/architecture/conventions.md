# Architecture Conventions

## Purpose

This file records stable engineering conventions that apply across the project.

Use it to help humans and coding agents make consistent implementation decisions without rediscovering the same rules from source code.

This file should answer:

- What conventions should new code follow?
- Which patterns are preferred or discouraged?
- Which boundaries should implementation preserve?
- Which conventions are stable enough to be treated as project guidance?

---

## Context Contract

| Field | Value |
|---|---|
| Context type | Durable architecture guidance |
| Source of truth for | Cross-project technical conventions |
| Read when | Planning implementation, refactor, migration, or review |
| Write when | A stable convention is discovered, changed, or explicitly accepted |
| Do not use for | Task logs, temporary preferences, unresolved debates, feature specs |

---

## Relationship To Other Files

| File | Boundary |
|---|---|
| `docs/architecture/system-overview.md` | explains major components and runtime structure |
| `docs/architecture/source-map.md` | maps code locations and ownership |
| `docs/architecture/flows.md` | explains important runtime or operational flows |
| `docs/decisions/` | records why a significant convention or tradeoff was accepted |
| `docs/tasks/` | records task-local investigation and implementation history |

If a convention exists because of an important tradeoff, link the relevant ADR instead of duplicating the rationale here.

---

## Naming Conventions

Document stable naming rules here.

Template:

```md
### [Convention Name]

- Applies to: [files / modules / APIs / tests / configs]
- Rule: [specific naming rule]
- Examples:
  - Good: `[example]`
  - Avoid: `[example]`
- Reason: [short rationale]
```

Current conventions:

```md
<!-- Add project-specific naming conventions during adoption or when accepted. -->
```

---

## Code Organization Conventions

Document how code should be grouped and where new code should be placed.

Template:

```md
### [Area]

- Place `[kind of code]` in `[path or module]`.
- Keep `[responsibility]` out of `[path or module]`.
- Prefer `[pattern]` when `[condition]`.
- Avoid `[anti-pattern]` because `[reason]`.
```

Current conventions:

```md
<!-- Add project-specific code organization conventions here. -->
```

---

## Boundary Conventions

Document boundaries agents must preserve during implementation.

Examples:

- UI should not bypass backend APIs for protected domain writes.
- Domain logic should not be duplicated across runtime components.
- Infrastructure concerns should stay out of product/domain modules.
- Test helpers should not become production dependencies.

Template:

```md
### [Boundary]

- Owner: [component / module / layer]
- Allowed dependencies: [list]
- Disallowed dependencies: [list]
- Enforcement: [tests / review / lint / convention]
- Related docs: [links]
```

Current boundaries:

```md
<!-- Add project-specific boundaries here. -->
```

---

## API And Integration Conventions

Document stable rules for API shape, integration patterns, error handling, retries, auth propagation, and compatibility expectations.

Template:

```md
### [API / Integration Area]

- Request pattern: [rule]
- Response pattern: [rule]
- Error pattern: [rule]
- Compatibility rule: [rule]
- Observability rule: [rule]
```

Current conventions:

```md
<!-- Add project-specific API and integration conventions here. -->
```

---

## Testing Conventions

Document stable expectations for tests and verification.

Template:

```md
### [Test Type]

- Use when: [condition]
- Location: [path]
- Naming: [rule]
- Required for: [task/change type]
- Avoid: [anti-pattern]
```

Current conventions:

```md
<!-- Add project-specific testing conventions here. -->
```

---

## Documentation Conventions

Document how durable context should be updated.

Baseline rules:

- Keep durable docs focused on accepted current behavior.
- Keep task-local investigation inside `docs/tasks/`.
- Use ADRs for decisions with lasting tradeoffs.
- Avoid copying the same rule into multiple durable files.
- Prefer short, path-oriented guidance over long explanations.

---

## Agent Usage

Before making non-trivial code changes, agents should:

1. Read this file for applicable conventions.
2. Check `docs/architecture/source-map.md` for relevant code locations.
3. Check `docs/architecture/flows.md` if the change affects runtime behavior.
4. Check `docs/decisions/` if a convention appears decision-driven.
5. Update this file only when a stable convention is added or changed.

Agents should not add conventions based only on one task-local implementation unless the convention is verified, accepted, and useful for future work.

---

## Readiness Checklist

This file is ready enough for agent use when:

- stable conventions are explicit rather than implied by code style
- conventions are scoped to where they apply
- boundaries are concrete enough to prevent unsafe changes
- conventions do not duplicate detailed implementation docs
- unresolved preferences are marked as open questions, not rules
