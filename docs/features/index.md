# Features Index

## Purpose

This index tracks durable feature documentation.

Feature folders under `docs/features/` describe verified current behavior.
Task folders under `docs/tasks/` describe how work happened.

Do not treat task history as the final source of truth.

---

## Feature Folder Structure

Feature folders live at:

```txt
docs/features/[feature-name]/
```

Recommended files:

- `behavior.md`
- `api.md`
- `data-model.md`
- `test-scenarios.md`
- `changelog.md`

Use templates from:

```txt
docs/templates/features/
```

Create only the feature files that preserve useful durable truth.
Small features may only need `behavior.md` and `test-scenarios.md`.

---

## Features

No feature docs have been added yet.

---

## Promotion Rule

Promote task findings into feature docs only after:

- behavior is verified
- tests confirm expected behavior
- or behavior is explicitly accepted as intended truth

Do not promote:

- implementation logs
- temporary investigation notes
- unverified assumptions
- speculative future behavior

---

## Update Rules

Update this index when:

- adding a feature folder
- renaming a feature
- deprecating a feature
- removing durable feature docs

Keep feature docs concise and behavior-centered.
