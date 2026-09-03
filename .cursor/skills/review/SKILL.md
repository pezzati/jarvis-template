---
name: review
description: Review the git diff for correctness, trust-boundary validation, and Ponytail over-engineering. Hands back an ordered delete-list and findings. Use when the user says /review or asks for a code review of the change.
disable-model-invocation: true
---

# Review

Code review of the current diff. Not spec audit (`/audit`).

## Steps

1. `git diff` (include staged and unstaged). If empty, say so and stop.
2. Check correctness: root cause vs symptom, callers of touched functions, failure modes.
3. Not lazy about: input validation at trust boundaries, data-loss handling, security.
4. Ponytail pass: abstractions nobody asked for, extra deps, boilerplate, cleverness. Hand back a **delete-list** (file/hunk + why it can go).
5. Ordered findings: blockers first, then nits. Do not rewrite the change unless asked.
