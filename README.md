# jarvis-template

Language-agnostic GitHub template for Cursor-first agentic coding.

New projects copy this harness, run bootstrap, then write their own code. There is no sample app and no default language.

## Use this template

1. On GitHub, mark this repo as a **Template repository** (Settings → General → Template repository).
2. Click **Use this template** to start a new project.
3. Clone it. Run:

```bash
./scripts/bootstrap.sh
```

4. Restart Cursor. In Agent chat say: **Index this project**.

Bootstrap installs what it can and prints hints for the rest. Missing Graphify or codebase-memory does not fail the whole script.

## What you get

| Layer | Role |
| --- | --- |
| Ponytail | Write the smallest code that works (YAGNI ladder). |
| Caveman | Short chat. Code, paths, and errors stay exact. Lite, always on. |
| Graphify | Conceptual map: code + docs + schemas. `/graphify`, `graphify query`. |
| codebase-memory | Structural graph via MCP: calls, types, blast radius, routes. |
| RFC → ADR → plan | Decide before coding. |

Always-on rules stay small. Long procedures are slash skills.

## Delivery loop

```
/rfc          draft RFC in docs/rfcs/draft/
/rfc-accept   move to accepted/, write ADR
/plan         detailed design from the ADR
/implement    execute the plan
/audit        check against RFC + ADR + plan
/review       diff review + Ponytail delete-list
```

Tiny fixes skip the loop. Anything architectural does not.

RFC status is a **folder** under `docs/rfcs/` (`draft`, `in-review`, `accepted`, `rejected`, `superseded`, `implemented`). Skills `git mv` the same `NNNN-slug.md` between folders.

## Context routing

Do not grep the repo to learn architecture.

- Structural (“what calls X”, blast radius) → codebase-memory MCP.
- Meaning/docs (“how does auth work”) → Graphify.
- Known file, small edit → Read/Grep.

See `.cursor/rules/context-routing.mdc`.

## Git

Trunk-based: short-lived branches off `main`, squash-merge PRs. Details in `.cursor/rules/git.mdc`.

- Branch: `feat/0001-session-store` (`type` / ADR or issue / slug)
- Commit: `feat(auth): persist sessions in redis`
- Breaking: `feat(auth)!: drop cookie sessions`
- `/commit` writes the message from the diff. Do not commit on `main`.

## Fmt hook

This template has no formatter. `.cursor/hooks/fmt-if-present.sh` no-ops until a derived project adds `just fmt`, `make fmt`, or an npm `fmt` script. Fail-open: a formatter error does not block the agent.

## Update vendored rules

Ponytail and Caveman copies are pinned in [THIRD-PARTY.md](THIRD-PARTY.md). To refresh:

1. Re-copy the upstream file into `.cursor/rules/`.
2. Keep the source URL comment.
3. Bump the SHA in `THIRD-PARTY.md`.

Do not vendor the Caveman proxy (BSL-1.1).

## Layout

```
AGENTS.md                 always-on contract (keep short)
.cursor/rules/            Ponytail, Caveman lite, routing
.cursor/skills/           /rfc /rfc-accept /plan /implement /audit /review /commit
.cursor/mcp.json          codebase-memory
docs/rfcs/                RFC template + per-status dirs
docs/decisions/           ADR template
docs/plans/               implementation plans
scripts/bootstrap.sh      one-time setup
```

## License

Apache-2.0. Third-party instruction files keep their upstream licenses; see [THIRD-PARTY.md](THIRD-PARTY.md).
