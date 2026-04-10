# Project runtime (`.agentic`)

This directory is the **Agentic Toolkit** runtime layer in **this** repository. In team mode it is usually **committed** so everyone shares context, workflow, and rules.

## Toolkit alignment

Record upgrades so the team knows which template version produced this tree:

| Field | Value |
|-------|-------|
| **Toolkit repo** | e.g. `https://github.com/bertom/cursor-agentic-toolkit` |
| **Git ref / tag** | e.g. `main` @ `abc1234` or release tag |
| **Last aligned** | YYYY-MM-DD |
| **Install profile** | `full` or `minimal` |

Update this block when you re-run `install-runtime.sh` from a newer toolkit checkout.

## Layout

| Path | Role |
|------|------|
| `context/` | Business, technical, constraints, governance, package policy |
| `index/` | `context-index.md`, `repo-map.md` |
| `workflow/` | Templates, validation matrix, briefs, specs, tasks, QA, decisions |
| `human-tasks/` | Pending/completed human-only steps |
| `rules/` | `agent-behavior.md` (full profile) |
| `guide/` | Toolkit guides (full profile) |
| `health/` | Context health template (full profile) |
| `team/` | Onboarding, PR prompt, Team Kit requirements, no-AI sync procedure |

**New here?** Start with [`team/ONBOARDING.md`](team/ONBOARDING.md).

---

*Installed from the Agentic Toolkit. Do not delete this file when merging toolkit updates — merge and refresh the alignment table.*
