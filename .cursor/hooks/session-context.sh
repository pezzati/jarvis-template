#!/usr/bin/env bash
# sessionStart: inject a short routing reminder if a graph exists. Never dump GRAPH_REPORT.md.
set -euo pipefail

has_graphify=0
has_cbm=0

if [[ -f graphify-out/GRAPH_REPORT.md ]] || [[ -f graphify-out/graph.json ]]; then
  has_graphify=1
fi

if [[ -f .cursor/mcp.json ]] && grep -q 'codebase-memory' .cursor/mcp.json 2>/dev/null; then
  has_cbm=1
fi

if [[ "$has_graphify" -eq 0 && "$has_cbm" -eq 0 ]]; then
  printf '%s\n' '{"additional_context":""}'
  exit 0
fi

msg="Prefer graphs over grep.
Structural questions -> codebase-memory MCP.
Meaning/docs/why -> graphify query. Do not paste GRAPH_REPORT.md.
Grep only for a known file or a 1-2 file edit.
Never query both graphs for the same question."

if command -v python3 >/dev/null 2>&1; then
  python3 -c 'import json,sys; print(json.dumps({"additional_context": sys.argv[1]}))' "$msg"
else
  # fallback: no quotes in msg besides the JSON we control
  printf '{"additional_context":"%s"}\n' "$msg"
fi
