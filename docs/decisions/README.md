# Architecture Decision Records

ADRs freeze **one reversible pick**. They are not a second RFC.

One journey RFC can own many ADRs. Numbers are independent: RFC-0004 may link ADR-0012 and ADR-0013.

- Template: [0000-template.md](0000-template.md)
- Next `MMMM` = max across `docs/decisions/*.md` (ignore `0000-template.md`), then +1
- `RFC:` must point at the RFC's **current** path (it moves between `docs/rfcs/<status>/`)

Write ADRs with `/rfc-accept` (one per independent decision in the RFC) or `/write-adr` (add more while the RFC stays `accepted/`). If codebase-memory MCP is up, also `manage_adr`.

Status `Implemented` is set by `/audit` for that ADR. The parent RFC moves to `implemented/` only when **every** listed ADR is `Implemented`.
