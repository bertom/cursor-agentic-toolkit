# Workflow

All workflow artifacts and templates live here. This is where the structured chain from intent to delivery is tracked.

## Structure

| Folder | Contents | Naming Convention |
|--------|----------|-------------------|
| `templates/` | Reusable templates — do not modify directly | `*-template.md` |
| `briefs/` | Feature briefs — capture intent and scope | `FB-NNN-<slug>.md` |
| `specs/` | Specifications — capture technical design | `SP-NNN-<slug>.md` |
| `decisions/` | Decision notes — capture important choices | `DN-NNN-<slug>.md` |
| `tasks/` | Task packs — capture implementation steps | `TP-NNN-<slug>.md` |
| `qa/` | QA reports — validation trail (often incremental, then finalized) | `QA-NNN-<slug>.md` (or date-based; see qa-checks rule) |

## Workflow Chain

```
Intent → Feature Brief → Spec → Decision Note (optional)
      → Task Pack → Implementation → QA Report → Doc Update
```

Each artifact references its parent and children by ID for traceability.

## How to Create Artifacts

Agents read the template from `templates/` and create a new file in the appropriate folder. Number sequentially — check existing files to find the next number.

See [WORKFLOW_EXPLAINED.md](../guide/WORKFLOW_EXPLAINED.md) for the full guide.

## Validation

- **[WORKFLOW_VALIDATION.md](WORKFLOW_VALIDATION.md)** — explicit validation at each stage (agents and humans), PR expectations, quick checklists.
- **[ONBOARDING.md](../team/ONBOARDING.md)** — human-friendly summary and first-hour path.
