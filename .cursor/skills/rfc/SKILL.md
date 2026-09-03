---
name: rfc
description: Interview the developer and write a Draft RFC from docs/rfcs/0000-template.md into docs/rfcs/draft/. Use when starting a feature, architecture change, or user-visible behavior, or when the user says /rfc.
disable-model-invocation: true
---

# RFC

Help write an RFC. Do **not** dump an empty template. Chat may be terse; the RFC file uses complete sentences.

Template: `docs/rfcs/0000-template.md`. Status folders: `docs/rfcs/README.md`.

## Steps

1. Read the template. Next `NNNN` = max number across **all** `docs/rfcs/<status>/NNNN-*.md`, then +1. Ignore `0000-template.md`.
2. Ask (or infer) the problem, who is hurt, constraints, and what done looks like. Stop if the problem is unclear.
3. Query Graphify and/or codebase-memory for current flow and related RFCs/ADRs. Put pointers in **Context**. Do not guess the codebase.
4. Draft **alternatives**, including do-nothing. Push back on a single-option RFC.
5. Fill every template section except detailed design. Stop at **Recommended solution**. Leave **Open questions** explicit. Do not invent answers.
6. Write `docs/rfcs/draft/NNNN-slug.md` with `Status: Draft`. Show what is still missing.
7. Revise that file until the developer is happy. When Open questions are empty, `git mv` to `docs/rfcs/in-review/` and set `Status: In Review`.

Tiny fixes (typo, one-liner) do not need an RFC. Tell the user to skip the loop.
