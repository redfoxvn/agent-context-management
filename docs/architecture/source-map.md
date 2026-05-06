# Source Map

Purpose:
Help agents quickly locate the correct implementation areas.

Update when:
- major modules move
- ownership changes
- new stable feature or module is introduced

| Domain / Feature | Main Modules | Entry Points | Key Files | Tests |
|---|---|---|---|---|
| Example Feature | apps/api | api/routes | feature.service.ts | tests/feature/* |

## Notes

- Prefer updating existing mappings over adding duplicates.
- Keep mappings coarse-grained and stable.
- Avoid listing every file.
