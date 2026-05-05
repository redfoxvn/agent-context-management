# Skill: Security Remediation

## Purpose
Analyze and remediate auth, permission, validation, secret, trust boundary, or data exposure risks.

## Use When
- A task affects security, auth, permissions, validation, secrets, or sensitive data.
- Trust boundaries or access rules are unclear.
- A vulnerability or security hardening task needs remediation and verification.

## Inputs
- Security concern, affected asset, actors, and impact.
- Relevant auth, permission, validation, logging, secret, or data exposure rules.
- Trust boundaries, feature docs, architecture docs, source files, and tests.
- Existing vulnerability evidence or hardening requirement.

## Procedure
1. Capture the affected asset, concern type, and impact.
2. Identify trust boundaries, actors, permission rules, validation rules, and data exposure paths.
3. Analyze exploitability at a practical remediation level without over-disclosing details.
4. Plan remediation and negative/security-focused tests.
5. Implement minimal safe changes.
6. Verify remediation and regression risk.
7. Update durable docs or ADRs if the security model changes.

## Outputs
- Security report, threat analysis, remediation plan, implementation-log, verification, and handoff artifacts.
- Updated architecture boundaries or feature docs when durable security behavior changes.

## Completion Criteria
- Affected asset, actors, trust boundary, and security rule are identified.
- Remediation plan preserves or strengthens validation, auth, permissions, logging, and type safety.
- Negative or security-focused verification is defined.
- Unclear security impact is escalated before implementation continues.

## Do Not
- Do not disclose exploit details beyond remediation needs.
- Do not weaken validation, auth, permissions, logging, or type safety to pass tests.
- Do not continue if security impact is unclear and affects product behavior or data exposure.
