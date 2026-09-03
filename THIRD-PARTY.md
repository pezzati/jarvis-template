# Third-party notices

Vendored instruction files. Re-copy from upstream and bump the SHA when updating.

## Ponytail

- Source: https://github.com/DietrichGebert/ponytail
- File: `.cursor/rules/ponytail.mdc`
- Upstream path: `.cursor/rules/ponytail.mdc`
- Pin: `2ed6c52c9d7e5e56942508591085fd45dea277d3`
- License: MIT

## Caveman (skill / activate rule only)

- Source: https://github.com/JuliusBrussee/caveman
- File: `.cursor/rules/caveman.mdc`
- Upstream path: `src/rules/caveman-activate.md`
- Pin: `3b74643f4d910f496babd4e634b1ba7168816f14`
- License: MIT (skill and adoption surfaces). The Caveman proxy/engine is BSL-1.1 and is **not** vendored here.

## Graphify

- Source: https://github.com/Graphify-Labs/graphify
- Install: `uv tool install graphifyy` then `./scripts/bootstrap.sh`
- License: Apache-2.0
- Not vendored. Project skill is installed by bootstrap.

## codebase-memory-mcp

- Source: https://github.com/DeusData/codebase-memory-mcp
- Wired via `.cursor/mcp.json` and `scripts/codebase-memory-mcp.sh`
- License: MIT
- Not vendored. Native binary preferred; `npx -y codebase-memory-mcp` is the fallback.
