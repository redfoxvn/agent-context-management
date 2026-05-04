# Source Map

## src/modules/auth
Handles authentication, sessions, token refresh, and authorization guards.

Read this first when modifying:
- login
- logout
- session cookie
- access token refresh
- auth middleware

Key files:
- src/modules/auth/auth.service.ts
- src/modules/auth/session.service.ts
- src/modules/auth/auth.controller.ts

Do not modify:
- src/modules/auth/legacy-token.ts unless handling backward compatibility.
