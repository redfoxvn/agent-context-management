# Decisions Index

## Purpose

This index tracks durable decision records.

Decision docs explain why an important choice was made.
Task docs explain how the work happened.
Architecture, product, and feature docs describe the resulting current truth.

---

## Decision Records

No decision records have been added yet.

---

## When To Create A Decision Record

Create a decision record when future agents or developers need to understand why a durable choice was made.

Good candidates:

- architecture boundary
- data model direction
- public API contract
- security or auth behavior
- product behavior with tradeoffs
- technology choice
- migration strategy
- long-term constraint

Do not create a decision record for:

- minor implementation details
- temporary workarounds
- task-local choices
- small naming or style preferences
- obvious bugfix decisions

---

## File Naming

Use:

```txt
docs/decisions/YYYY-MM-DD-short-title.md
```

Keep names stable and descriptive.

---

## Template

Use:

```txt
docs/templates/decisions/adr.template.md
```

---

## Update Rules

Update this index when:

- adding a decision record
- superseding a decision
- rejecting or deprecating a decision
- renaming a decision file

Keep decision records concise and consequence-focused.
