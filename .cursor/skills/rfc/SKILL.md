---
name: rfc
description: Interview the developer and write a Draft RFC from docs/rfcs/0000-template.md into docs/rfcs/draft/. Use when starting a feature, architecture change, journey, or user-visible behavior, or when the user says /rfc.
disable-model-invocation: true
---

# RFC

Help write an RFC. Do **not** dump an empty template. Chat may be terse; the RFC file uses complete sentences.

Template: `docs/rfcs/0000-template.md`. Status folders: `docs/rfcs/README.md`.

A journey RFC may stay large. Independent picks become separate ADRs later. Do not split the RFC just to make ADRs.

## Steps

1. Read the template. Next RFC `NNNN` = max number across **all** `docs/rfcs/<status>/NNNN-*.md`, then +1. Ignore `0000-template.md`.
2. Ask (or infer) the problem, who is hurt, constraints, and what done looks like. Stop if the problem is unclear.
3. Query Graphify and/or codebase-memory for current flow and related RFCs/ADRs. Put pointers in **Context**. Do not guess the codebase.
4. Draft **alternatives**, including do-nothing. Push back on a single-option RFC.
5. Fill every template section except detailed design. In **Recommended solution**, list **independent decisions** as bullets (one bullet is fine). Do not invent extra ADRs. Push back only if two bullets are the same pick.
6. Write `docs/rfcs/draft/NNNN-slug.md` with `Status: Draft` and empty `ADRs:`. Show what is still missing.
7. Revise that file until the developer is happy. When Open questions are empty, `git mv` to `docs/rfcs/in-review/` and set `Status: In Review`.

Tiny fixes (typo, one-liner) do not need an RFC. Tell the user to skip the loop.
