---
name: rfc-accept
description: Accept or reject an in-review RFC. On accept, git mv to docs/rfcs/accepted/ and write one ADR per independent decision. Use when the user says the RFC is accepted, rejected, or /rfc-accept.
disable-model-invocation: true
---

# RFC accept

Refuse unless the human explicitly accepts or rejects. The RFC should already be in `docs/rfcs/in-review/`.

Templates: `docs/rfcs/0000-template.md`, `docs/decisions/0000-template.md`. Numbering: `docs/decisions/README.md`.

## Accept

1. Open questions must be empty. **Recommended solution** must have a bullet list of independent decisions. Refuse if there is no list. One bullet is allowed. Confirm the list with the human.
2. `git mv` to `docs/rfcs/accepted/NNNN-slug.md`. Set `Status: Accepted`. Bump `Last-Updated`.
3. For **each** confirmed bullet, next ADR `MMMM` = max across `docs/decisions/*.md` (ignore `0000-template.md`), then +1. Write `docs/decisions/MMMM-slug.md`: short Decision, Status `Accepted`, `RFC:` = current RFC path, alternatives as one-liners pointing at the RFC.
4. Fill RFC `ADRs:` with those paths.
5. If codebase-memory MCP is connected, `manage_adr` once per new ADR.

Do not copy the RFC into an ADR. Do not write detailed design.

## Reject

`git mv` to `docs/rfcs/rejected/`. Set `Status: Rejected`. Do **not** write ADRs.
