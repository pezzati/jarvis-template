---
name: commit
description: Create a Conventional Commit from the current diff. Subject is type(scope): description. Body is a bullet list of changes. Use when the user asks to commit or says /commit.
disable-model-invocation: true
---

# Commit

Do not commit unless the user asked. Follow `.cursor/rules/git.mdc`.

## Steps

1. `git status` and `git diff` (staged + unstaged) and `git log -5 --oneline`.
2. If the work belongs on a feature branch and HEAD is `main`, stop and create `<type>/<adr-or-issue>-<slug>` first.
3. Stage only the files for **one** logical change. Leave unrelated files unstaged.
4. Subject: `<type>(<optional-scope>): <description>`
   - Imperative, lowercase, no trailing period.
   - Breaking: `feat(api)!: ...` plus a `BREAKING CHANGE:` footer if migration is not obvious.
5. Body: blank line after the subject, then a bullet list of **what changed** (files/behavior), taken from the diff. Not a restatement of the subject. Not a raw file dump.
6. Commit with a HEREDOC (subject, blank line, bullets, optional footer). Do not add `Co-authored-by`. Do not `--no-verify` unless the user asked.

   ```
   git commit -m "$(cat <<'EOF'
   ci: remove harness-check workflow

   - delete GitHub Actions harness-check workflow
   - delete scripts/check-harness.sh
   EOF
   )"
   ```

7. Show `git status` after. Do not push unless asked.
