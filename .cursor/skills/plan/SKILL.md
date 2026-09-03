---
name: plan
description: Write detailed design from an accepted RFC and its ADR into docs/plans/. Use after /rfc-accept, or when the user says /plan. Refuse if no accepted RFC plus ADR.
disable-model-invocation: true
---

# Plan

Requires an RFC in `docs/rfcs/accepted/` **and** its ADR. Refuse otherwise (point at `/rfc` / `/rfc-accept`).

This is detailed design. Do not rewrite the RFC. Do not implement yet.

Template: `docs/plans/0000-template.md`. Number matches RFC/ADR.

## Steps

1. Read the accepted RFC and ADR. Query Graphify / codebase-memory only for files and flows the decision touches.
2. Write `docs/plans/NNNN-slug.md`: components, data/API shape, failure modes, migration, files to touch, sequence, risks, test plan mapped to RFC success criteria.
3. Ponytail: smallest plan that implements the ADR. No extra abstractions.
4. Link RFC and ADR paths. If those files later move, update this plan's links.
