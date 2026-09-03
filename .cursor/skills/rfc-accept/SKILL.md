---
name: rfc-accept
description: Accept or reject an in-review RFC. On accept, git mv to docs/rfcs/accepted/ and write the matching ADR. Use when the user says the RFC is accepted, rejected, or /rfc-accept.
disable-model-invocation: true
---

# RFC accept

Refuse unless the human explicitly accepts or rejects. The RFC should already be in `docs/rfcs/in-review/`.

Templates: `docs/rfcs/0000-template.md`, `docs/decisions/0000-template.md`.

## Accept

1. Open questions must be empty. **Recommended solution** must exist.
2. `git mv` to `docs/rfcs/accepted/NNNN-slug.md`. Set `Status: Accepted`. Fill `ADR: docs/decisions/NNNN-slug.md`. Bump `Last-Updated`.
3. Create `docs/decisions/NNNN-slug.md`. **NNNN matches the RFC.** `RFC:` is the current path (`docs/rfcs/accepted/NNNN-slug.md`).
4. ADR is the **decision**, not a copy of the RFC: short Context, Decision (the recommended solution), Consequences, Alternatives as one-liners linking the RFC.
5. If codebase-memory MCP is connected, also `manage_adr`.

## Reject

`git mv` to `docs/rfcs/rejected/`. Set `Status: Rejected`. Do **not** write an ADR.
