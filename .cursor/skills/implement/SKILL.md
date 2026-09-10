---
name: implement
description: Execute docs/plans/MMMM-slug.md for one ADR. Query graphs before wandering. Use when the user says /implement or asks to build a planned ADR.
disable-model-invocation: true
---

# Implement

Execute an existing plan for **one ADR**. Do not invent scope.

## Steps

1. Require `docs/plans/MMMM-slug.md`, that ADR, and the parent RFC in `accepted/`. Refuse if missing. Other ADRs on the same RFC may still be unfinished.
2. If HEAD is `main`, create `<type>/<adr>-<slug>` using the **ADR** number (see `.cursor/rules/git.mdc`). Never implement on `main`.
3. Query Graphify or codebase-memory (see routing rule) before wandering the tree.
4. Climb the Ponytail ladder. Shortest working diff. No extra files.
5. Non-trivial logic: leave **one** runnable check (smallest thing that fails if the logic breaks). Trivial one-liners need no test.
6. New I/O and error paths: log per `.cursor/rules/logging.mdc` (JSON, levels, context fields, no secrets).
7. Stop when the plan's sequence is done. Do not `/audit` unless asked.
