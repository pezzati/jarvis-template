#!/usr/bin/env bash
# afterFileEdit: run project fmt if a target exists. No formatter in this template → no-op.
# Fail-open: never block the agent.
set +e

input=$(cat)

file_path=""
if command -v python3 >/dev/null 2>&1; then
  file_path=$(printf '%s' "$input" | python3 -c 'import json,sys
try:
    print(json.load(sys.stdin).get("file_path") or "")
except Exception:
    print("")')
fi

run_fmt() {
  local file="${1:-}"
  justfile_path=""
  [[ -f justfile ]] && justfile_path=justfile
  [[ -f Justfile ]] && justfile_path=Justfile
  if [[ -n "$justfile_path" ]] && grep -qE '^fmt($|[[:space:]]|:)' "$justfile_path"; then
    if [[ -n "$file" ]]; then
      just fmt "$file" 2>/dev/null || just fmt
    else
      just fmt
    fi
    return
  fi
  if [[ -f Makefile ]] && grep -qE '^fmt:' Makefile; then
    if [[ -n "$file" ]]; then
      make fmt FILE="$file" 2>/dev/null || make fmt
    else
      make fmt
    fi
    return
  fi
  if [[ -f package.json ]] && command -v python3 >/dev/null 2>&1; then
    has_fmt=$(python3 -c 'import json,sys
p=json.load(open("package.json"))
print("yes" if "fmt" in p.get("scripts",{}) else "no")')
    if [[ "$has_fmt" == "yes" ]]; then
      if [[ -n "$file" ]]; then
        npm run fmt -- "$file" 2>/dev/null || npm run fmt
      else
        npm run fmt
      fi
    fi
  fi
}

run_fmt "$file_path" >/dev/null 2>&1
exit 0
