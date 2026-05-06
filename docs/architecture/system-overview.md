# System Overview

## Purpose

Briefly describe:
- system shape
- major runtime components
- request or data flow
- external dependencies

Keep concise.

---

## Runtime Structure

```txt
Client
  -> UI Server
  -> API
  -> Database
```

---

## Major Components

| Component | Responsibility |
|---|---|
| UI | User interaction |
| API | Business logic |
| Database | Persistent storage |

---

## Important Flows

| Flow | Summary |
|---|---|
| Authentication | Cookie -> session -> API auth |
| Data Fetching | UI server calls backend API |

---

## Constraints

- Example: UI must not access database directly.
- Example: Feature modules communicate through service layer only.
