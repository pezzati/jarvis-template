---
name: pr
description: Open a GitHub pull request from the current branch using .github/PULL_REQUEST_TEMPLATE.md. Fill Summary and Changes from git log. Always return the PR URL. Use when the user asks for a PR, merge request, or says /pr.
disable-model-invocation: true
---

# Pull request

Follow `.cursor/rules/git.mdc`. Do not open a PR unless the user asked.

## Steps

1. Refuse if HEAD is `main`. Need a feature branch with commits ahead of `main`.
2. `git log main..HEAD` (subjects + bodies) and `git diff main...HEAD --stat`.
3. Push if needed: `git push -u origin HEAD`.
4. Title: squash Conventional Commit `type(scope): description`.
5. Body: copy structure from `.github/PULL_REQUEST_TEMPLATE.md`.
   - **Summary:** the PR title / theme.
   - **Changes:** bullet list assembled from commit **bodies** (and subjects if a body is missing).
   - **RFC / ADR / Plan:** paths if this branch implements a decision; skip for `chore/skip-*`.
   - **Breaking:** check if any commit subject contains `!`.
   - **Test plan:** what was run, or "not run" if none.
6. `gh pr create --title "..." --body "$(cat <<'EOF' ... EOF)"` with base `main`.
7. **Reply with the pull request URL** (the `https://github.com/.../pull/N` line from `gh`). If `gh` fails, show the error and the `github.com/owner/repo/compare/...` URL. Never claim a PR exists without that link.
