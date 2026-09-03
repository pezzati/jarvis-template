---
name: audit
description: Check the diff against RFC success criteria, ADR, and plan. On pass, git mv the RFC to docs/rfcs/implemented/. Use when the user says /audit. Not a style review.
disable-model-invocation: true
---

# Audit

Spec compliance, not style. `/review` is the code review.

## Steps

1. Load RFC (usually `docs/rfcs/accepted/NNNN-slug.md`), ADR, and `docs/plans/NNNN-slug.md`.
2. Compare the git diff and behavior to RFC **Success criteria**, ADR **Decision**, and the plan.
3. Report three lists: **met** / **missed** / **extra** (scope creep).
4. On pass: `git mv` RFC to `docs/rfcs/implemented/`, set `Status: Implemented`, bump `Last-Updated`, update ADR `RFC:` path and any plan RFC link.
5. On fail: leave the RFC in `accepted/`. List what remains. Do not mark Implemented.
