---
name: plan
description: Write detailed design for one ADR into docs/plans/MMMM-slug.md. Requires an accepted RFC and a named ADR. Use after /rfc-accept or /write-adr, or when the user says /plan.
disable-model-invocation: true
---

# Plan

Requires an RFC in `docs/rfcs/accepted/` **and a named ADR**. Refuse otherwise (point at `/rfc` / `/rfc-accept` / `/write-adr`).

This is detailed design for **that ADR**. Do not rewrite the RFC. Do not implement yet.

Template: `docs/plans/0000-template.md`. File number **MMMM matches the ADR**, not the RFC.

## Steps

1. Read the accepted RFC and the named ADR. Query Graphify / codebase-memory only for files and flows this ADR touches.
2. Write `docs/plans/MMMM-slug.md`: components, data/API shape, failure modes, migration, files to touch, sequence, risks, test plan mapped to the RFC success criteria **this ADR covers**.
3. Ponytail: smallest plan that implements this ADR. No extra abstractions.
4. Link RFC and ADR paths. If the RFC later moves, update this plan's `RFC:` path.
