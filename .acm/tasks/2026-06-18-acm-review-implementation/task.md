# Task: ACM Review Implementation

## Classification
- Type: `refactor` + `new-feature`
- Scope: Implement recommendations from comprehensive ACM review
- Created: 2026-06-18

## Context
Sau khi phân tích toàn bộ ACM project và so sánh với Superpowers + Agent-Skills frameworks, đã xác định:

**Issues chính:**
1. Tactical skills thiếu anti-rationalization mechanisms
2. Overlap giữa requirement-analysis, codebase-research, implementation-planning với acm-task
3. Generic verification sections (không specific cho task type)
4. Thiếu critical skills: TDD, systematic-debugging, context-engineering, code-review, git-workflow
5. Thiếu cross-references giữa các skills

**Objectives:**
- Add 5 new skills từ Superpowers/Agent-Skills
- Consolidate 3 overlapping skills vào acm-task
- Enhance verification sections cho tất cả tactical skills
- Add cross-references để improve skill composition
- Update documentation

## Objectives
1. **Phase 1:** Add 5 new skills + consolidate 3 overlapping skills (21 → 23 skills)
2. **Phase 2:** Enhance tactical skills (verification, cross-references)
3. **Phase 3:** Update documentation (index, README, migration guide)

## Affected Files
- 5 new skill folders to create
- 3 skill folders to delete (after consolidation)
- 1 skill to enhance (acm-task)
- 14 tactical skills to enhance (verification + cross-references)
- Documentation files (index.md, README.md)

## Verification Strategy
- Each new skill follows ACM skill authoring guidelines
- Consolidated skills preserve all functionality
- Verification sections are specific and actionable
- Cross-references are accurate and helpful
- Documentation reflects new structure

## Risks
- **Risk:** Breaking existing workflows when consolidating skills
  - **Mitigation:** Migrate content carefully, test with real scenarios
- **Risk:** Token overhead from adding too many skills
  - **Mitigation:** Keep skills concise, use cross-references instead of duplication
- **Risk:** Agents confused by new structure
  - **Mitigation:** Clear migration guide, update index.md

## Status
- Status: `phase-2-implemented`
- Latest action: Enhanced tactical skill verification and cross-references for Phase 2
- Verification: `git diff --check`; confirmed 9 target skills have specialized verification and `Related Skills`
- Next action: Review Phase 2 diff, then commit if approved

## Related
- Review analysis: (completed in conversation)
- ACM skill authoring: `skills/acm-skill-authoring/SKILL.md`
