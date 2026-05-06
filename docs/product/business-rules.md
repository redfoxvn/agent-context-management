# Business Rules

Purpose:
Describe stable business behavior and constraints.

## Rules

| Area | Rule |
|---|---|
| Authentication | Only verified users may access protected resources |
| Billing | Subscription required for premium features |
| Collaboration | Only workspace members may modify workspace resources |

---

## Validation / Constraints

- Emails must be unique.
- Deleted resources may remain recoverable for a retention period.

---

## Notes

- Prefer durable rules over edge-case implementation details.
- Move temporary logic discussions into task documents instead.
