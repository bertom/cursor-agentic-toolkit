# Context sync — without AI

> Use this when you **do not** use an AI coding agent. Goal: keep `.agentic/` aligned with what you shipped so the team does not drift.

## When to run

- Before you open a PR that changes **product behavior**, **architecture**, **public API**, **dependencies**, or **security** posture.
- After a long stretch of local commits that never touched `.agentic/`.

## Procedure (about 15–30 minutes)

1. **List what changed** in your branch (files, features, breaking changes). Write it in your PR description first if that helps.

2. **Open** [`.agentic/index/context-index.md`](../index/context-index.md) and note which context files apply to your change.

3. **Update by hand** (or with your editor only — no agent):
   - [`technical-context.md`](../context/technical-context.md) — stack, architecture, integrations affected.
   - [`constraints.md`](../context/constraints.md) — new limits or relaxed limits.
   - [`repo-map.md`](../index/repo-map.md) — new/removed/moved top-level areas.
   - [`context-index.md`](../index/context-index.md) — new sources, status/last-updated if you added or retired docs.
   - [`package-policy.md`](../context/package-policy.md) — if dependency policy changed.

4. **Workflow artifacts (non-trivial work):** If this PR would normally need FB → SP → TP under team rules, either:
   - add a **short decision note** under `workflow/decisions/` explaining scope and why workflow was abbreviated, **or**
   - backfill brief/spec/task pack titles and links in the PR description so traceability exists.

5. **Optional rolling log:** If your team uses [`.agentic/index/context-changelog.md`](../index/context-changelog.md), add one line (date + what + PR link).

6. **Self-check:** Read [`.agentic/workflow/WORKFLOW_VALIDATION.md`](../workflow/WORKFLOW_VALIDATION.md) PR row — ensure your PR description mentions artifact IDs or justified skips.

## If you prefer help drafting text

Use the same steps but run the **[PR review prompt](prompts/pr-review-prompt.md)** in an AI tool **only** to suggest wording; you still **review and commit** every `.agentic/` change yourself.

---

*Team Kit — human-only path. Complements agent-led updates in `agent-behavior.md` Rule 8.*
