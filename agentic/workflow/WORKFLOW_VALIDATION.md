# Workflow validation matrix

> **Canonical reference:** what must be checked at each stage before moving on. Use this for **agents** (Cursor, Copilot, etc.) and **humans** (authors, reviewers).  
> **Human onboarding summary:** [ONBOARDING.md](../team/ONBOARDING.md) (same rules, plainer language).

Paths below use runtime layout: `.agentic/…` (in toolkit source, read as `agentic/…`).

---

## How to use this file

1. **Agents:** Before closing a stage (e.g. before starting the spec), confirm the **Pass criteria** row for the current artifact; run **Agent validation** tasks; stop for human approval when **Human validation** is required.
2. **Humans:** Use **Human validation** when reviewing a PR or approving a doc; use **Pass criteria** as the definition of done for that stage.
3. **Trivial work** (typos, formatting, ≤3 files, no behavior change): full matrix optional — see [WORKFLOW_EXPLAINED.md](../guide/WORKFLOW_EXPLAINED.md) *Skipping Steps*.

---

## Matrix (feature workflow)

| Stage | Artifact | What this validates | Agent validation (must do) | Human validation (must do) | Pass criteria |
|-------|----------|---------------------|------------------------------|----------------------------|---------------|
| **A. Intent** | — | Problem is understood before design | Restate goal; ask clarifying questions; check context index for related work | Confirm problem, priority, and rough scope | Human agrees capture is right **or** explicitly skips to a smaller artifact set |
| **B. Feature brief** | `FB-NNN-*.md` | **What** and **why**; success criteria; boundaries | Draft from template; link related context; flag gaps | Review scope, success criteria, and assumptions; approve or request changes | Status **approved** (or recorded **skip** with reason in brief or decision note) |
| **C. Spec** | `SP-NNN-*.md` | **How**; fit with architecture; acceptance criteria | Draft from template; reference FB; check `package-policy.md` if deps change; list risks | Review design, AC, and dependencies; approve gated items per `governance.md` | Status **approved** (or recorded **skip**); spec ↔ FB traceable |
| **D. Decision note** | `DN-NNN-*.md` (if needed) | Important forks recorded before irreversible work | Draft options, recommendation, consequences; link spec | Choose option or send back for revision | Decision recorded; linked from spec/task pack as needed |
| **E. Task pack** | `TP-NNN-*.md` | Work is splittable, traceable, unblocked | Break into tasks; QA expectations per task; **create** `human-tasks/pending/*.md` for human-only steps; link filenames in Human Tasks table | Review sizing, ordering, blockers, human-task files exist (not table-only) | Status **approved**; every human-only step has a **pending** file |
| **F. Implementation** | Code / config | Matches spec & tasks; stays small | Read context; one task focus; package policy; human tasks when blocked; **incremental QA log** in `QA-NNN-*.md` (see `.cursor/rules/qa-checks.mdc`) | Spot-check high-risk areas if authoring manually; ensure no secrets | Tasks done; changes match TP; governance followed |
| **G. QA report** | `QA-NNN-*.md` | Quality and regressions recorded | Run project checks (lint, types, build, tests, …); append incremental log during work; finalize tables + status | Review failures, follow-ups, and residual risk | Overall QA status set; known gaps explicit |
| **H. Doc / context update** | Index + context | Repo truth matches product | Update `repo-map.md`, `context-index.md`, context files per [agent-behavior.md](../rules/agent-behavior.md) Rule 8; align §6.1 changelog practice if used | PR review: context/docs match behavior change | No silent drift; traceability links still valid |

---

## Pull request (human + optional agent assist)

Not a separate workflow artifact; validates the **batch** before merge.

| What this validates | Agent (optional) | Human reviewer | Pass criteria |
|---------------------|------------------|----------------|---------------|
| Intent chain intact | Can scan for FB/SP/TP/QA IDs in PR description | Confirms traceability for non-trivial work | IDs present or **skip** documented |
| Context / docs | Can flag touched areas without matching `.agentic/` updates | Checks `.agentic/` when behavior or architecture changed | Context index / repo map / context files consistent or **N/A** justified |
| **Pre-PR tool (manual coding)** | Run [pr-review-prompt.md](../team/prompts/pr-review-prompt.md): list doc gaps, propose `.agentic/` edits | Author **reviews** proposals, accepts/rejects, **commits** accepted updates into the same PR | No merge requirement unless team policy says so; gaps addressed or explicitly deferred |
| Conventions | Can run style/toolkit checklist if prompted | Code review + governance | Team standards met |
| Security | Never commit secrets; flag patterns | Review sensitive changes | No secrets; gates respected |

**Manual-only workflow:** before you open a PR, run the PR prompt ([`pr-review-prompt.md`](../team/prompts/pr-review-prompt.md)) — paste it, **`@`-mention the file**, or follow its instructions in chat with your branch summary; fold agreed `.agentic/` updates into the PR. **No AI at all:** use [CONTEXT_SYNC.md](../team/CONTEXT_SYNC.md) instead. Neither replaces human review.

---

## Quick gate checklist (agents)

- [ ] **B** Brief approved or skipped with record  
- [ ] **C** Spec approved or skipped with record  
- [ ] **D** Decision note done if spec called for it  
- [ ] **E** Task pack approved; human-task **files** exist  
- [ ] **F** Implementation tied to TP; QA log updated as checks run  
- [ ] **G** QA file finalized for the batch  
- [ ] **H** Context / index updates complete  

---

## Quick gate checklist (humans)

- [ ] I reviewed **scope and assumptions** at brief/spec for this work  
- [ ] I approved or explicitly **skipped** workflow steps where applicable  
- [ ] **Human tasks** in `pending/` exist for my dashboard/API/env steps  
- [ ] **PR** description links artifacts or explains skip  
- [ ] **Context** in `.agentic/` matches what we shipped (or I filed a follow-up)  
- [ ] If I coded **manually:** I ran the **PR prompt** or **CONTEXT_SYNC** before submit  

---

*Maintained by the Agentic Toolkit. Update when workflow gates change.*
