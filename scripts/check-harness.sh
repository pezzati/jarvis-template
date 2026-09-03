#!/usr/bin/env bash
# Validate the Cursor harness layout. No language toolchain required.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
fail=0

err() { printf 'FAIL  %s\n' "$1" >&2; fail=1; }
ok() { printf 'ok    %s\n' "$1"; }

# --- AGENTS.md ---
if [[ ! -f AGENTS.md ]]; then
  err "AGENTS.md missing"
else
  lines=$(wc -l < AGENTS.md | tr -d ' ')
  if [[ "$lines" -gt 120 ]]; then
    err "AGENTS.md is $lines lines (max 120)"
  else
    ok "AGENTS.md ($lines lines)"
  fi
fi

# --- RFC / ADR templates and status dirs ---
[[ -f docs/rfcs/0000-template.md ]] || err "docs/rfcs/0000-template.md missing"
[[ -f docs/decisions/0000-template.md ]] || err "docs/decisions/0000-template.md missing"
ok "RFC and ADR templates"

for d in draft in-review accepted rejected superseded implemented; do
  if [[ ! -d "docs/rfcs/$d" ]]; then
    err "docs/rfcs/$d missing"
  fi
done
ok "RFC status dirs"

# --- hooks.json ---
if [[ ! -f .cursor/hooks.json ]]; then
  err ".cursor/hooks.json missing"
else
  if command -v python3 >/dev/null 2>&1; then
    python3 - <<'PY' || err "hooks.json invalid or version != 1"
import json, sys
with open(".cursor/hooks.json") as f:
    data = json.load(f)
if data.get("version") != 1:
    sys.exit(1)
PY
    ok "hooks.json version 1"
  elif grep -q '"version": 1' .cursor/hooks.json; then
    ok "hooks.json version 1 (grep)"
  else
    err "hooks.json missing version 1"
  fi
fi

# --- rules frontmatter ---
shopt -s nullglob
mdc_files=(.cursor/rules/*.mdc)
if [[ ${#mdc_files[@]} -eq 0 ]]; then
  err "no .cursor/rules/*.mdc"
fi
for f in "${mdc_files[@]}"; do
  if ! awk '
    BEGIN { in_fm=0; desc=0; aa=0 }
    NR==1 && $0=="---" { in_fm=1; next }
    in_fm && $0=="---" { exit }
    in_fm && $0 ~ /^description:/ { desc=1 }
    in_fm && $0 ~ /^alwaysApply:/ { aa=1 }
    END { exit !(desc && aa) }
  ' "$f"; then
    err "$f missing description or alwaysApply in frontmatter"
  else
    ok "$f frontmatter"
  fi
done

# --- skills: name matches folder ---
skill_files=(.cursor/skills/*/SKILL.md)
if [[ ${#skill_files[@]} -eq 0 ]]; then
  err "no .cursor/skills/*/SKILL.md"
fi
for f in "${skill_files[@]}"; do
  folder=$(basename "$(dirname "$f")")
  name=$(awk '
    BEGIN { in_fm=0 }
    $0=="---" { in_fm++; next }
    in_fm==1 && $0 ~ /^name:/ {
      sub(/^name:[[:space:]]*/, "")
      gsub(/[[:space:]]/, "")
      print
      exit
    }
  ' "$f")
  if [[ "$name" != "$folder" ]]; then
    err "$f name='$name' != folder '$folder'"
  else
    ok "skill $folder"
  fi
done

# --- secrets ---
while IFS= read -r -d '' f; do
  err "secret-like file: $f"
done < <(find . -path ./.git -prune -o -path ./.idea -prune -o \
  \( -name '.env' -o -name '.env.*' -o -name '*.pem' -o -name '*.key' -o -name 'id_rsa' -o -name 'credentials.json' \) \
  -not -name '.env.example' -print0 2>/dev/null)

if [[ "$fail" -ne 0 ]]; then
  echo "harness check failed" >&2
  exit 1
fi
echo "harness check passed"
