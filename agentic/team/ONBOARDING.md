# Team onboarding — Agentic Toolkit

> **First hour:** skim this page, then open the links in order. **Validation detail:** [.agentic/workflow/WORKFLOW_VALIDATION.md](../workflow/WORKFLOW_VALIDATION.md) (same rules, full matrix).

## Who this is for

- Developers new to the repo **or** new to this toolkit.  
- People with **little or no** AI-assisted coding experience: you can still review every change; the repo stays the source of truth.  
- Skeptics: the goal is **shared facts** and **less rework**, not replacing your judgment.

## Why bother?

- **One place** for architecture, constraints, and decisions — humans and tools read the same files.  
- **Traceability:** from a PR you can walk back to **why** we built something (brief → spec → tasks → QA).  
- **Onboarding** does not depend on one person’s memory.

AI **amplifies** good context (fewer wrong assumptions). It does **not** remove the need for your review.

## First-hour path

1. **[context-index.md](../index/context-index.md)** — what documents exist and what they’re for.  
2. **[governance.md](../context/governance.md)** — git, security, approval gates.  
3. **[WORKFLOW_VALIDATION.md](../workflow/WORKFLOW_VALIDATION.md)** — **who checks what** at each step (bookmark this).  
4. **[WORKFLOW_EXPLAINED.md](../guide/WORKFLOW_EXPLAINED.md)** — deeper narrative of the chain (requires **full** install profile if `guide/` is present).  
5. **[agent-behavior.md](../rules/agent-behavior.md)** — rules for agents (full profile installs `rules/`).

Optional: [HUMAN_TASKS.md](../guide/HUMAN_TASKS.md), [QUICKSTART.md](../guide/QUICKSTART.md). If a link 404s, re-run install with `--profile full`.

## The chain (intent → delivery)

```
Idea
  → Feature brief (what & why)
  → Spec (how)
  → Decision note (only if we must record a big fork)
  → Task pack (concrete steps)
  → Implementation
  → QA report
  → Update context / index / repo map
```

Small fixes can skip most of this — see WORKFLOW_EXPLAINED *Skipping Steps*.

## Validation — humans vs agents

**Rule of thumb:** agents **draft** and **run checks**; humans **approve** artifacts and **merge** when the evidence is there. Neither side skips **pass criteria** without recording a **skip** (brief note is enough).

| Step | You (human) mainly validate… | Agent mainly validates… |
|------|------------------------------|-------------------------|
| **Brief** | Scope, success criteria, “is this the right problem?” | Completeness vs template, links to context, gaps flagged |
| **Spec** | Design, risks, acceptance criteria, gated areas (see governance) | Package policy, consistency with brief, missing AC |
| **Decision note** | The actual choice | Options and consequences written clearly |
| **Task pack** | Task size, order, blockers; **every human-only step has a file** in `human-tasks/pending/` | Same; must **create** those files, not only mention them in the table |
| **Implementation** | High-risk edits if you code by hand | Context read first; small steps; incremental QA log |
| **QA** | That failures and follow-ups are honest | Runs lint/tests/build; records results in `QA-NNN-*.md` |
| **Docs / context** | PR review: behavior matches `.agentic/` updates | Updates index, repo map, context after meaningful change |

**Full checklist:** [WORKFLOW_VALIDATION.md](../workflow/WORKFLOW_VALIDATION.md).

## Working with an agent (practical)

1. Point it at **`.agentic/`** first (“read context-index and relevant context”).  
2. For anything **non-trivial**, ask for **brief → spec → task pack** before large code dumps.  
3. **Dashboard / secrets / hosting env:** the agent should create **`human-tasks/pending/<name>.md`** — you execute those steps, not the chat.  
4. If **you** code **with** an agent but want a last check: before opening the PR, run the **[PR review prompt](prompts/pr-review-prompt.md)** — it surfaces documentation gaps and proposed `.agentic/` edits; you say **yes/no** and commit what you accept **into the same PR**.

5. If you **do not use AI at all:** follow **[CONTEXT_SYNC.md](CONTEXT_SYNC.md)** before every meaningful PR (manual checklist). You may still paste the PR prompt once if you want drafting help for doc text — you remain the committer.

Cursor uses **`.cursor/rules/`**; GitHub Copilot in VS Code uses **`.github/copilot-instructions.md`**. The installer copies a **thin** project file from [`team/copilot-instructions.project.md`](copilot-instructions.project.md). Keep it aligned with Cursor rules using [`team/AI_INSTRUCTIONS_SYNC.md`](AI_INSTRUCTIONS_SYNC.md). See [TEAM_KIT_V1_REQUIREMENTS.md](TEAM_KIT_V1_REQUIREMENTS.md) §3.

## Team Kit expectations (summary)

Shared **`.agentic/`** in git, personal notes in **`project-ops`** — if they disagree, **the repo wins**. Run **context health** periodically. See TEAM_KIT_V1_REQUIREMENTS for full policy.

---

*Maintained by the Agentic Toolkit. Point new teammates here first.*
