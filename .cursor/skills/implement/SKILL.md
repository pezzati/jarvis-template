---
name: implement
description: Execute docs/plans/NNNN-slug.md. Query graphs before wandering. Use when the user says /implement or asks to build an accepted, planned RFC.
disable-model-invocation: true
---

# Implement

Execute an existing plan. Do not invent scope.

## Steps

1. Require `docs/plans/NNNN-slug.md`, RFC in `accepted/`, and matching ADR. Refuse if missing.
2. If HEAD is `main`, create `<type>/<adr>-<slug>` first (see `.cursor/rules/git.mdc`). Never implement on `main`.
3. Query Graphify or codebase-memory (see routing rule) before wandering the tree.
4. Climb the Ponytail ladder. Shortest working diff. No extra files.
5. Non-trivial logic: leave **one** runnable check (smallest thing that fails if the logic breaks). Trivial one-liners need no test.
6. Stop when the plan's sequence is done. Do not `/audit` unless asked.
