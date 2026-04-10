# Project AI instructions (GitHub Copilot)

You work in a project that uses the **Agentic Toolkit** runtime under `.agentic/`.

## Before non-trivial code changes

1. Read `.agentic/index/context-index.md`
2. Read `.agentic/workflow/WORKFLOW_VALIDATION.md` for stage gates
3. Read `.agentic/rules/agent-behavior.md` (if present; full install profile)
4. Read `.agentic/context/governance.md` and `.agentic/context/package-policy.md` when relevant

## Workflow

Feature brief → spec → task pack → implementation → QA → context updates. Do not skip gates unless the user explicitly records a **skip** in workflow artifacts.

## Human-only steps

Create **one** `.agentic/human-tasks/pending/<name>.md` per distinct human action (use `human-task-template.md`). Fill **Assigned to**, **Created (date)** (`YYYY-MM-DD`), and **Created by**. Do not only list human work in prose or in the task-pack table.

## Pre-PR

Authors may paste or `@`-mention `.agentic/team/prompts/pr-review-prompt.md` to surface documentation gaps before opening a PR.

## Cursor vs Copilot

Detailed behavior lives in **`.cursor/rules/*.mdc`** (Cursor). This file stays **thin** and points at `.agentic/` so both tools share the same facts. When you change high-level behavior, update **both** surfaces. Read **`.agentic/team/AI_INSTRUCTIONS_SYNC.md`** for the checklist (same file exists under `agentic/team/` in toolkit source before install).

---

*Source: `agentic/team/copilot-instructions.project.md` in the toolkit; installed copy lives at `.github/copilot-instructions.md`. Keep thin — follow `.agentic/team/AI_INSTRUCTIONS_SYNC.md`.*
