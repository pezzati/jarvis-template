---
name: commit
description: Create a Conventional Commit from the current diff. Use when the user asks to commit, write a commit message, or says /commit. Follows type(scope): description and ! for breaking changes.
disable-model-invocation: true
---

# Commit

Do not commit unless the user asked. Follow `.cursor/rules/git.mdc`.

## Steps

1. `git status` and `git diff` (staged + unstaged) and `git log -5 --oneline`.
2. If the work belongs on a feature branch and HEAD is `main`, stop and create `<type>/<adr-or-issue>-<slug>` first.
3. Stage only the files for **one** logical change. Leave unrelated files unstaged.
4. Message: `<type>(<optional-scope>): <description>`
   - Imperative, lowercase, no trailing period.
   - Breaking: `feat(api)!: ...` and a `BREAKING CHANGE:` footer if migration is not obvious.
   - Match the repo's recent log style for type names.
5. Commit with a HEREDOC. Do not add `Co-authored-by` or trailer junk. Do not `--no-verify` unless the user asked.
6. Show `git status` after. Do not push unless asked.
