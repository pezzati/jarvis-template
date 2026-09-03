# RFCs

Status is the **directory**. Skills `git mv` `NNNN-slug.md` between folders and keep the header `Status:` in sync.

| Folder | Meaning |
| --- | --- |
| `draft/` | `/rfc` is filling or revising |
| `in-review/` | Open questions empty; human decides |
| `accepted/` | Human accepted; ADR exists; `/plan` allowed |
| `rejected/` | No ADR |
| `superseded/` | Replaced by a later RFC |
| `implemented/` | `/audit` passed |

`0000-template.md` is the template only. Never a live RFC.

Next number is `max(NNNN)` across **all** status dirs, then +1.

When moving a file, update:

- RFC `Status:` and `ADR:`
- ADR `RFC:` path
- Plan links to the RFC
