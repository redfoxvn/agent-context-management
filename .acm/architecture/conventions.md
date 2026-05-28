# Architecture Conventions

Purpose:
Record stable engineering conventions that help agents make consistent implementation decisions.

This file is the project rulebook for how code should be written, organized, tested, and integrated.

Use this file to answer:

- What conventions should new code follow?
- Which patterns are preferred or discouraged?
- Which boundaries should implementation preserve?
- Which conventions are stable enough to guide future work?

---

## Relationship To Architecture Files

| File | Role |
|---|---|
| `system-overview.md` | Major runtime components and system-level structure |
| `source-map.md` | Navigation from product/domain areas to code and tests |
| `module-boundaries.md` | Module ownership and dependency constraints |
| `flows.md` | Important runtime or operational flows |
| `conventions.md` | Stable engineering rules and implementation conventions |

If a convention exists because of an important tradeoff, keep the short rule here and record the rationale in `.acm/decisions/`.

---

## Naming Conventions

| Area | Rule | Examples | Notes |
|---|---|---|---|
| `[files / modules / APIs / tests]` | `[naming rule]` | `[good / avoid examples]` | `[reason or constraint]` |

Rules:

- Prefer conventions that appear consistently across the codebase.
- Include examples when the rule is easy to misapply.
- Do not create a naming rule from a one-off observation.

---

## Code Organization Conventions

| Area | Place Here | Keep Out | Notes |
|---|---|---|---|
| `[area-or-layer]` | `[responsibility that belongs here]` | `[responsibility that should not live here]` | `[reason or related docs]` |

Examples of useful conventions:

- where domain logic belongs
- where API handlers belong
- where shared utilities belong
- where test helpers belong
- which layer owns validation or orchestration

---

## Boundary Conventions

| Boundary | Rule | Enforcement | Related Docs |
|---|---|---|---|
| `[boundary-name]` | `[allowed / disallowed interaction]` | `[tests / review / lint / convention]` | `[links]` |

Examples:

- UI should not bypass backend APIs for protected domain writes.
- Domain logic should not be duplicated across runtime components.
- Infrastructure concerns should stay out of product/domain modules.
- Test helpers should not become production dependencies.

Use `module-boundaries.md` for module ownership and dependency matrices.
Use this section for broader project-wide implementation conventions.

---

## API And Integration Conventions

| Area | Request / Input | Response / Output | Error / Retry | Notes |
|---|---|---|---|---|
| `[api-or-integration]` | `[rule]` | `[rule]` | `[rule]` | `[compatibility or observability notes]` |

Examples of useful conventions:

- response shape
- error format
- retry and timeout behavior
- idempotency expectations
- auth propagation
- logging and observability expectations

---

## Testing Conventions

| Test Type | Use When | Location | Required For | Avoid |
|---|---|---|---|---|
| `[unit / integration / e2e / regression]` | `[condition]` | `[path]` | `[change type]` | `[anti-pattern]` |

Use this section to clarify what kind of verification is expected for common change types.

---

## Documentation Conventions

Baseline rules:

- Keep durable docs focused on accepted current behavior.
- Keep task-local investigation inside `.acm/tasks/`.
- Use ADRs for decisions with lasting tradeoffs.
- Avoid copying the same rule into multiple durable files.
- Prefer concise, path-oriented guidance over long explanations.

---

## What Belongs Here

- stable naming conventions
- stable code organization rules
- broad implementation boundaries
- API and integration conventions
- testing expectations
- documentation update conventions

## What Does Not Belong Here

- task history
- temporary implementation notes
- unresolved debates
- speculative conventions
- detailed feature behavior
- long rationale better captured in ADRs

---

## Agent Usage

Agents should read this file when:

- planning non-trivial implementation work
- deciding where new code belongs
- refactoring existing code
- reviewing changes for consistency
- checking whether a change violates project conventions

Agents should update this file when:

- a stable convention is discovered during adoption
- an accepted convention changes
- repeated review feedback should become explicit guidance
- a boundary rule needs to be made durable

Agents should not add conventions based only on one task-local implementation unless the convention is verified, accepted, and useful for future work.
