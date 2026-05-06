# Business Rules

Purpose:
Describe stable business behavior and constraints.

## Rules

| Area | Rule |
|---|---|
| Access Control | Only authorized actors may access protected resources |
| Entitlement | Restricted capabilities require valid entitlement or approval |
| Collaboration | Only actors with sufficient role may modify shared resources |

---

## Validation / Constraints

- Canonical identifiers should remain unique within their scope.
- Deleted or archived resources may remain recoverable for a retention period.

---

## Notes

- Prefer durable rules over edge-case implementation details.
- Move temporary logic discussions into task documents instead.
