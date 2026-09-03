#!/usr/bin/env bash
# One-time setup after "Use this template". Missing tools print hints; they do not fail the whole script.
set -u

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

ok() { printf 'ok    %s\n' "$1"; }
skip() { printf 'skip  %s\n' "$1"; }
hint() { printf 'hint  %s\n' "$1"; }

echo "jarvis-template bootstrap"
echo "root: $root"
echo

# --- dirs ---
for d in \
  docs/rfcs/draft docs/rfcs/in-review docs/rfcs/accepted \
  docs/rfcs/rejected docs/rfcs/superseded docs/rfcs/implemented \
  docs/decisions docs/plans
do
  mkdir -p "$d"
done
ok "docs/rfcs status dirs + decisions + plans"

# --- Graphify ---
if ! command -v graphify >/dev/null 2>&1; then
  if command -v uv >/dev/null 2>&1; then
    hint "installing graphifyy via uv"
    if uv tool install graphifyy; then
      ok "graphifyy"
    else
      skip "uv tool install graphifyy failed"
    fi
  else
    skip "graphify (install uv: curl -LsSf https://astral.sh/uv/install.sh | sh)"
    hint "then: uv tool install graphifyy && uv tool update-shell"
  fi
fi

if command -v graphify >/dev/null 2>&1; then
  graphify install --project --platform agents >/dev/null 2>&1 || skip "graphify agents skill"
  graphify install --project --platform cursor >/dev/null 2>&1 || skip "graphify cursor skill"
  # Keep a single always-on routing rule; drop Graphify's competing alwaysApply mdc.
  if [[ -f .cursor/rules/graphify.mdc ]]; then
    rm -f .cursor/rules/graphify.mdc
    ok "removed .cursor/rules/graphify.mdc (context-routing.mdc owns graph guidance)"
  fi
  if [[ ! -f graphify-out/graph.json ]]; then
    hint "building first graph (graphify extract .)"
    graphify extract . || skip "graphify extract"
  else
    ok "graphify-out already present"
  fi
  graphify hook install >/dev/null 2>&1 && ok "graphify git post-commit hook" || skip "graphify hook install"
else
  skip "graphify CLI not on PATH"
fi

# --- codebase-memory ---
if ! command -v codebase-memory-mcp >/dev/null 2>&1; then
  hint "native install: curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash"
  if command -v npx >/dev/null 2>&1; then
    ok "npx fallback wired in scripts/codebase-memory-mcp.sh"
  else
    skip "npx also missing; install Node or the native CBM binary"
  fi
else
  ok "codebase-memory-mcp on PATH"
  codebase-memory-mcp config set auto_index true >/dev/null 2>&1 && ok "CBM auto_index true" || skip "CBM auto_index"
fi

if [[ ! -f .cursor/mcp.json ]]; then
  mkdir -p .cursor
  cat > .cursor/mcp.json <<'EOF'
{
  "mcpServers": {
    "codebase-memory": {
      "command": "bash",
      "args": ["scripts/codebase-memory-mcp.sh"]
    }
  }
}
EOF
  ok "wrote .cursor/mcp.json"
else
  ok ".cursor/mcp.json exists"
fi

echo
echo "Restart Cursor, then in Agent: Index this project"
echo "Delivery loop: /rfc → /rfc-accept → /plan → /implement → /audit → /review"
