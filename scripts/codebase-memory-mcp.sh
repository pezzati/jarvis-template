#!/usr/bin/env bash
# Launch codebase-memory-mcp: native binary if on PATH, else npx.
set -euo pipefail

if command -v codebase-memory-mcp >/dev/null 2>&1; then
  exec codebase-memory-mcp "$@"
fi

if command -v npx >/dev/null 2>&1; then
  exec npx -y codebase-memory-mcp "$@"
fi

echo "codebase-memory-mcp not found. Install the native binary (see ./scripts/bootstrap.sh) or npm/npx." >&2
exit 1
