# Business Rules

Purpose:
Describe stable business behavior, validation rules, and domain constraints.

Keep rules durable and behavior-focused.

## Rules

| Area | Rule |
|---|---|
| `[business-area]` | `[stable behavior or constraint]` |
| `[business-area]` | `[stable behavior or constraint]` |

---

## Validation / Constraints

- `[validation or invariant]`
- `[retention, ownership, or access rule]`

---

## Notes

- Prefer durable rules over edge-case implementation details.
- Move temporary logic discussions into task documents.
- Avoid duplicating API validation logic unless it represents a business invariant.

---

## Agent Usage

Agents should read this file when:
- changing business behavior
- validating implementation assumptions
- reviewing edge cases tied to product rules
- deciding whether behavior changes are backward compatible

Agents should update this file when:
- stable business rules change
- validation constraints change
- long-lived policy behavior changes
