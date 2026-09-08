---
name: write-adr
description: Add a new ADR to an already-accepted RFC. Independent numbering. Use when a journey RFC needs another reversible pick, or the user says /write-adr.
disable-model-invocation: true
---

# Write ADR

Add one reversible pick to an RFC that is already in `docs/rfcs/accepted/`.

Refuse if the RFC is draft, in-review, rejected, superseded, or missing. Point at `/rfc` / `/rfc-accept` instead.

Template: `docs/decisions/0000-template.md`. Next `MMMM` = max across `docs/decisions/*.md` (ignore `0000-template.md`), then +1.

## Steps

1. Read the RFC and its existing ADRs. Interview the new independent pick (what is frozen, why not already an ADR).
2. If the pick **contradicts** an existing ADR, stop and say so. Do not reopen the RFC's alternatives list unless the human wants a new RFC.
3. Write `docs/decisions/MMMM-slug.md`: Status `Accepted`, `RFC:` current accepted path, short Decision, one-line alternatives pointing at the RFC.
4. Append the path to the RFC `ADRs:` list. Bump RFC `Last-Updated`.
5. If codebase-memory MCP is connected, `manage_adr`.

Do not write a plan. Point at `/plan` for this ADR when they want design.
