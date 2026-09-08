---
name: audit
description: Check the diff against one ADR, its plan, and the RFC criteria that ADR covers. On pass, mark the ADR Implemented. Move the RFC to implemented/ only when every linked ADR is Implemented. Use when the user says /audit. Not a style review.
disable-model-invocation: true
---

# Audit

Spec compliance for **this ADR**, not the whole RFC. `/review` is the code review.

## Steps

1. Load the named ADR, `docs/plans/MMMM-slug.md`, and the parent RFC (usually `docs/rfcs/accepted/NNNN-slug.md`).
2. Compare the git diff and behavior to this ADR **Decision**, the plan, and the RFC **Success criteria this ADR covers**.
3. Report three lists: **met** / **missed** / **extra** (scope creep).
4. On fail: leave ADR `Accepted`. Do not move the RFC.
5. On pass: set ADR Status to `Implemented`. If **every** path in the RFC `ADRs:` list is `Implemented`, `git mv` the RFC to `docs/rfcs/implemented/`, set RFC `Status: Implemented`, bump `Last-Updated`, and update every linked ADR `RFC:` path and every linked plan `RFC:` path. Otherwise leave the RFC in `accepted/`.
