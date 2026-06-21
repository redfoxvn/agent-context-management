---
name: acm-adversarial-review
description: Use when making high-stakes architectural decisions, security-sensitive changes, or irreversible migrations that need fresh-context review.
---

# Skill: ACM Adversarial Review

## Use For

Subject non-trivial, high-stakes decisions to fresh-context adversarial review before they stand.

## When To Use

- Architectural decisions affecting multiple modules
- Security-sensitive changes (auth, permissions, data exposure)
- Irreversible migrations (schema changes, data transformations)
- Decisions with high blast radius (public API, billing, data integrity)
- When a wrong call is hard to reverse and a fresh check now is cheaper than debugging later — high confidence is a trigger here, not a reason to skip

## When NOT To Use

- Trivial changes (renaming, formatting, file moves)
- Clear, unambiguous user instructions
- One-line changes with obvious correctness
- User explicitly asked for speed over verification

## Iron Law

```txt
NO HIGH-STAKES DECISION STANDS WITHOUT FRESH-CONTEXT REVIEW
```

A confident answer is not a correct answer. Long sessions accumulate context that quietly turns assumptions into "facts" without anyone noticing. High-stakes decisions need a reviewer who has not been in the conversation.

**Violating the letter of this rule is violating the spirit of ACM.**

## Getting a Fresh Context

"Fresh context" means a reviewer that has NOT accumulated this session's
assumptions. The principle is fixed; the mechanism depends on your runtime:

- **Claude Code**: dispatch a subagent with the Task tool (e.g. a `code-reviewer`
  agent), seeded with only the ARTIFACT + CONTRACT — never the conversation history.
- **Codex**: start a separate session or a new `codex` invocation and pass only
  the extracted unit; use a different model when one is available.
- **OpenCode**: spawn a subagent/task or open a separate session that contains
  only the ARTIFACT + CONTRACT.
- **Any runtime**: escalating to a *different model* strengthens the review when
  correctness matters more than cost.

Whichever you use, the reviewer must receive ARTIFACT + CONTRACT only — not the
CLAIM and not your reasoning (both bias it toward agreement).

If no fresh-context mechanism is available for a high-stakes decision, do NOT
rely on self-review — escalate to the user instead. Self-review from the same
context cannot catch the blind spots this skill exists to surface; reporting it
as an independent check would be false.

## The Process

### Step 1: CLAIM - Surface the Decision

Name the decision in 2-3 lines:

```
CLAIM: "The new caching layer is thread-safe under read-heavy workload"
WHY THIS MATTERS: Race condition here corrupts user data
```

If you cannot write the claim that compactly, you have a vibe, not a decision. Surface it before scrutinizing it.

### Step 2: EXTRACT - Smallest Reviewable Unit

Extract the artifact and contract, not the reasoning:

- Code: the diff or function (not the whole file)
- Decision: the proposal in 3-5 sentences plus constraints
- Assertion: the claim plus supporting evidence

**Strip your reasoning.** Handing over conclusions biases the reviewer toward agreement. The unit must be small enough that a reviewer can hold it in mind in one read.

### Step 3: DOUBT - Invoke Fresh-Context Review

Use adversarial prompt:

```
Adversarial review. Find what is wrong with this artifact.
Assume the author is overconfident. Look for:
- Unstated assumptions
- Edge cases not handled
- Hidden coupling or shared state
- Ways the contract could be violated
- Existing conventions this might break

Do NOT validate. Do NOT summarize. Find issues.

ARTIFACT: <paste artifact>
CONTRACT: <paste contract>
```

**Pass ARTIFACT + CONTRACT only. Do NOT pass the CLAIM.** Handing the reviewer your conclusion biases it toward agreement.

### Step 4: RECONCILE - Fold Findings Back

For each finding, classify:

1. **Contract misread** - reviewer misunderstood the contract
2. **Valid + actionable** - real issue requiring change
3. **Valid trade-off** - issue is real but cost of fixing exceeds accepting
4. **Noise** - reviewer flagged something actually correct

A fresh reviewer can be wrong because it lacks context. Do not defer just because it is "fresh."

### Step 5: STOP - Bounded Loop

Stop when:
- Next iteration returns only trivial findings
- 3 cycles completed (escalate to user)
- User explicitly says "ship it"

If 3 cycles is "obviously insufficient" because the artifact is large: the artifact is too big. Return to Step 2 and decompose. Do not lift the bound.

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "I'm confident, skip the review" | Confidence correlates poorly with correctness on novel problems. Moments of certainty are exactly when blind spots hide. |
| "Spawning a reviewer is expensive" | Debugging a wrong decision in production is more expensive. The check is bounded; the bug is not. |
| "The reviewer will just nitpick" | Only if unscoped. Constrain the prompt to "issues that would make this fail under the contract." |
| "I'll review at the end with acm-completion" | acm-completion is a final gate. Adversarial review catches wrong directions early when course-correction is cheap. |
| "If I doubt every step I'll never ship" | The skill applies to high-stakes decisions, not every keystroke. Re-read "When NOT To Use." |
| "The reviewer disagreed so I was wrong" | The reviewer lacks your context. Disagreement is information, not verdict. Re-read the artifact, classify, then decide. |

## Red Flags - STOP and Review

Stop when you notice:

- Spawning a reviewer for a one-line rename
- Treating reviewer output as authoritative without re-reading artifact
- Looping >3 cycles without escalating
- Prompting "is this good?" instead of "find issues"
- Skipping review under time pressure on high-stakes decisions
- Re-spawning fresh-context on an unchanged artifact (you will get the same findings; you are stalling)
- Doubt theater: across 2+ cycles where reviewer surfaced substantive findings, zero were classified as actionable
- Doubting only after committing (that is acm-completion, not adversarial review)
- Passing the CLAIM to the reviewer (biases toward agreement)
- Stripping the contract from the reviewer's input

**ALL of these mean: STOP. Follow the process. Review before committing.**

## Interaction with Other Skills

- **acm-completion**: complementary. acm-completion is post-hoc verification gate; adversarial review is in-flight per-decision. Use both.
- **acm-task**: use acm-task to classify and load context first. Adversarial review applies to decisions made during task execution.
- **acm-memory**: if adversarial review reveals a durable truth change, use acm-memory to promote it after verification.

## Verification

Before considering adversarial review complete:

- [ ] Every high-stakes decision was named as a CLAIM before standing
- [ ] At least one fresh-context review per non-trivial artifact
- [ ] Reviewer received ARTIFACT + CONTRACT only (not CLAIM, not reasoning)
- [ ] Reviewer prompt was adversarial ("find issues"), not validating ("is it good")
- [ ] Findings were classified against artifact text (not rubber-stamped)
- [ ] Stop condition was met (trivial findings, 3 cycles, or user override)
