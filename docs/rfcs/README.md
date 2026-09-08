# RFCs

Status is the **directory**. Skills `git mv` `NNNN-slug.md` between folders and keep the header `Status:` in sync.

One RFC can own **many ADRs**. RFC numbers and ADR numbers are independent.

| Folder | Meaning |
| --- | --- |
| `draft/` | `/rfc` is filling or revising |
| `in-review/` | Open questions empty; human decides |
| `accepted/` | Human accepted; **at least one ADR** exists; `/plan` allowed per ADR |
| `rejected/` | No ADRs |
| `superseded/` | Replaced by a later RFC |
| `implemented/` | `/audit` passed for **every** linked ADR |

`0000-template.md` is the template only. Never a live RFC.

Next RFC number is `max(NNNN)` across **all** status dirs, then +1. Next ADR number is `max(MMMM)` across `docs/decisions/`, then +1.

When moving a file, update:

- RFC `Status:` and `ADRs:` list
- every linked ADR `RFC:` path
- every linked plan `RFC:` path
