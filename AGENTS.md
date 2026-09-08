# Agent contract

Cursor-first harness. Prefer project skills over inventing process.

## Delivery loop

RFC → accept (one or more ADRs) → plan per ADR → implement → audit → review.

Skip the loop only for trivial fixes (typo, one-liner). Architecture or user-visible behavior starts at `/rfc`.

- Draft RFCs: `docs/rfcs/draft/`
- Folder is status. Skills `git mv` the file when status changes.
- `/plan` is refused until an RFC is in `docs/rfcs/accepted/` and a named ADR exists. Plan number matches the ADR, not the RFC.
- `/write-adr` adds more ADRs to an accepted RFC. Detailed design lives in `/plan`, not in the RFC.

## Context routing

See `.cursor/rules/context-routing.mdc`. Short version:

- Structural code (calls, types, blast radius, routes) → codebase-memory MCP first.
- Meaning, docs, schemas, “why” → Graphify (`graphify query`, `GRAPH_REPORT.md`).
- Grep/Read last: known filename or a 1–2 file edit.
- Never query both graphs “just in case.”

## Persist decisions

- RFCs: `docs/rfcs/<status>/`
- ADRs: `docs/decisions/`
- Plans: `docs/plans/`
- If codebase-memory MCP is up, also `manage_adr`.

## Safety

Do not commit secrets. Do not force-push `main`.

Git: trunk-based. Branch `type/adr-or-issue-slug`. Commit `type(scope): description`; `!` for breaking. See `.cursor/rules/git.mdc`.

## Bootstrap

If graphs are missing, tell the human to run `./scripts/bootstrap.sh`, then restart Cursor and say: Index this project.
