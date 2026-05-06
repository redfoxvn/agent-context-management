# Skill: Documentation Update

## Use For

Update the correct context layer after task or durable truth changes.

## Key Moves

- Use `docs/index.md` to identify the owning source of truth.
- Keep task history in `docs/tasks/`.
- Update durable docs only when verified current truth changes.
- Update indexes when important artifacts are added, renamed, or deprecated.
- Prevent conflicts between task notes and durable docs.

## Output

- updated task docs
- updated durable docs when needed
- updated indexes
- documented skipped doc updates when relevant

## Escalate When

- ownership of truth is unclear
- task notes conflict with durable docs
- documentation state no longer matches verified behavior
