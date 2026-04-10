# Team Kit v1 — Finalized requirements

> Operational spec for team mode on top of the [Agentic Toolkit](https://github.com/bertom/cursor-agentic-toolkit). Intent and principles live in [`team-kit.md`](../../team-kit.md) (repo root).

## 1. Scope

- **One toolkit repo, team as a profile:** extend the existing toolkit; shared behavior lives in the **application** repository under `.agentic/` (and `.cursor/`, `.github/` as needed), not a separate “team toolkit” product repo.
- **Human-first, AI-compatible:** workflow must work without AI; AI accelerates and keeps context aligned when used as specified below.

---

## 2. Repository policy (`.agentic` in git)

### 2.1 Default: commit the whole `.agentic` tree

- **Gitignore:** Ignoring `.agentic/` in `.gitignore` is **optional** (e.g. public repo where runtime cannot be published). **Default install** uses `--gitignore-mode committed`: **do not** ignore `.agentic/`; only the **ops link name** (e.g. `project-ops`) is ignored. Use `--gitignore-mode recommended` to ignore both runtime dir and ops link (legacy / solo private runtime).
- **Default:** the entire `.agentic/` folder is **version-controlled** in the project repo so the team shares:
  - rules and guides (`agentic/rules`, guides, index),
  - **context** (`context/`, `index/`),
  - **workflow artifacts** (briefs, specs, task packs, QA, decisions, human-tasks),
  - health templates and reports as the team chooses.
- **Rationale:** traceability from code and PRs back to intent, specs, and tasks.
- **Exception:** if something **cannot** live in git (secrets, credentials, local-only paths), keep it out of `.agentic` or use placeholders and document the real location in governance — do **not** treat “no commit” as default without a recorded reason.

### 2.2 Governance changes

- **Anyone may propose changes** to `governance.md` (and related policy files).
- **Team agreement** is a **social norm**, not a separate embedded workflow engine: use PR review and team discussion as you already do for any important policy change.

### 2.3 Context files: avoid manual edits (drift control)

- **Rule:** do **not** hand-edit files under `.agentic/context/` (and the same discipline for `index/repo-map.md` / `index/context-index.md` when they summarize that context), **except**:
  - **sign-off** edits on workflow artifacts where the process explicitly expects human approval in-file (e.g. marking a brief or spec **approved**), or
  - tiny non-substantive fixes **only if** the team explicitly allows them (prefer still doing those via agent + PR for traceability).
- **Rationale:** manual edits to “source of truth” context without the same rigor as code changes causes **context drift** and contradicts traceability.
- **Corollary — AI-assisted coding as default:** the team expects work that affects product behavior to be done **with an agent** following toolkit rules, so context updates stay coupled to changes.
- **Escape hatch — manual coding:** before PR, either (1) run the **[PR review prompt](prompts/pr-review-prompt.md)** in an AI tool and **commit** accepted `.agentic/` updates into the PR, or (2) if the author uses **no AI at all**, follow **[CONTEXT_SYNC.md](CONTEXT_SYNC.md)**. No procedure ⇒ treat as policy gap to fix, not an excuse to skip updates.

### 2.4 Operational memory (`project-ops`) vs repo context

- **`project-ops`** (symlink or external folder) holds **personal** or **non-repo** operational notes; it is **outside** the canonical shared tree.
- **Conflict rule:** if `project-ops` (or any personal notes) disagrees with **committed** `.agentic/` context or workflow artifacts, **the repo is leading**. Personal ops must be updated or discarded, not the other way around.
- **Context health:** periodic checks (see §7) **must** include a row for **repo vs personal/external**: inconsistencies listed, resolved toward repo truth.

### 2.5 Per-developer responsibility

- **Each developer** runs the **context health / scan** (or equivalent checklist) on their machine when relevant — e.g. after pull, before a large PR, or on a schedule the team agrees — so local assumptions do not accumulate silently.

---

## 3. Multi-tool AI configuration (Cursor + Copilot)

### 3.1 Cursor

- **Primary project rules:** `.cursor/rules/` (`.mdc` and related), as today. These are **committed** in the application repo for team alignment.

### 3.2 GitHub Copilot (VS Code extension)

Copilot does **not** use `.cursor/rules`. Use GitHub’s and VS Code’s **instruction file** locations instead (features evolve; verify in current docs):

| Mechanism | Location | Role |
|-----------|----------|------|
| Repository-wide instructions | **`.github/copilot-instructions.md`** | Closest equivalent to “always-on” project rules for Copilot Chat / agent in that workspace. |
| Optional workspace agent file | **`AGENTS.md`** at repo root (and optionally nested; nearest wins in some setups) | Multi-agent / project onboarding style instructions; may need a VS Code setting to discover nested paths. |
| Scoped instructions | **`.github/instructions/**/*.instructions.md`** | File-type or area-specific rules via frontmatter (`applyTo`, etc.). |

**Official references:**

- [Use custom instructions in VS Code](https://code.visualstudio.com/docs/copilot/customization/custom-instructions) — describes `copilot-instructions.md`, `AGENTS.md`, and `.instructions.md` layouts.
- [Adding repository custom instructions for GitHub Copilot](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions) — repository-level `copilot-instructions.md`.

### 3.3 Single source of truth (team discipline)

- **Problem:** duplicating long rules in both `.cursor/rules` and `.github/copilot-instructions.md` will **drift**.
- **Shipped:** **`agentic/team/copilot-instructions.project.md`** is copied to **`.github/copilot-instructions.md`** by `install-runtime.sh` (creates `.github/`; existing file skipped unless `--force`). **Playbook:** [AI_INSTRUCTIONS_SYNC.md](AI_INSTRUCTIONS_SYNC.md) (checklist, installer behavior, periodic health row).
- **Team Kit expectation:** **`.agentic/`** holds detailed behavior (`rules/agent-behavior.md`, workflow docs); **Copilot file stays thin** (pointers + high-signal bullets); **`.cursor/rules`** packages Cursor-specific triggers/globs.
- **PR / optional prompt (§5):** when changing toolkit or high-level agent behavior, verify both Cursor and Copilot surfaces (see AI_INSTRUCTIONS_SYNC checklist).
- **Future automation:** optional CI “diff guard” is compatible with v1 but not required here.

---

## 4. Install, propagation, and onboarding

### 4.1 Install and propagation

- **Single install model:** bootstrap/install the toolkit **into the project repo** locally; after **merge to the shared branch**, everyone gets the same `.agentic/` and tool config **via git pull** — no separate “team server” install.
- **Ongoing evolution:** any team member may run installs or upgrades locally, but **changes to shared context** (technical, business, architecture, constraints, index) are **committed and pushed** like code so everyone works from the same base.

### 4.2 Onboarding and adoption (including AI newcomers)

**Goal:** a new developer who does **not** know this toolkit (and may have **little or no** AI-assisted development experience) can follow **one short path** and understand **why** the structure exists — without feeling forced into hype or opaque ceremony.

**Requirements:**

- **Entry path (first hour):** follow **[`agentic/team/ONBOARDING.md`](../team/ONBOARDING.md)** (installed to `.agentic/team/ONBOARDING.md`): ordered links (context-index → governance → workflow → **validation** → agent-behavior). The path must fit on **one screen** in that file; optional team one-pager may prepend a single link to ONBOARDING.
- **Intent → validation chain:** canonical **matrix** in **[`agentic/workflow/WORKFLOW_VALIDATION.md`](../workflow/WORKFLOW_VALIDATION.md)** — each row lists what is validated, **agent** actions, **human** actions, and **pass criteria**. ONBOARDING summarizes the same chain for humans; agents must use the full matrix (also referenced from `.cursor/rules/workflow-feature.mdc` and `agent-behavior.md` Rule 11).
- **Context maintenance & traceability:** onboarding must **point explicitly** to the non-negotiables: shared context in repo (§2), traceability chain (§6), periodic health scan (§7), repo wins over personal ops (§2.4). Wording should be **concrete** (“don’t hand-edit `technical-context.md`”) not abstract.
- **Why this makes life easier:** a short, honest block aimed at skeptics — e.g. less time re-explaining architecture in chat, fewer wrong assumptions from missing context, PRs linkable to intent, onboarding that doesn’t depend on one person’s head. **No** claim that AI replaces judgment; **yes** that good shared context improves **human and** AI reasoning because both read the same facts.
- **How to work with the agent:** minimum expectations spelled out — e.g. let the agent read `.agentic/` first; use the workflow steps for non-trivial work; use human-task files for things only a human can do; after manual coding, run the **context sync** procedure (§2.3); Cursor vs Copilot: both use committed project rules, different file locations (§3).
- **Skepticism-friendly:** onboarding acknowledges that AI tools differ and that **the repo stays authoritative**; team members can still review every change; AI is **optional for some steps** but **context hygiene** applies to everyone who merges work that affects the product.

### 4.3 Adoption note

Pilot with one feature or one sprint if needed; align with iterative adoption in [`team-kit.md`](../../team-kit.md) §10.

---

## 5. PR prompt (pre-submit or review assist)

- **Shipped:** [`.agentic/team/prompts/pr-review-prompt.md`](../team/prompts/pr-review-prompt.md) (runtime path). Paste into Cursor, Copilot Chat, or another agent.
- **Not a merge gate by default:** teams may adopt it as policy; otherwise it **assists** authors and reviewers.
- **Manual coding path:** author runs the prompt **before** opening the PR; the agent lists documentation gaps and proposes `.agentic/` updates; the human **accepts or rejects** each suggestion and **commits** accepted changes into the **same PR**.
- **Purpose:** verify **docs / context / workflow artifacts** vs code changes, check **conventions** (toolkit, governance, package policy), flag issues, note good patterns.

---

## 6. Traceability (non-trivial work)

- Prefer an explicit chain where possible: **PR** → **TP-NNN** → **SP-NNN** → **FB-NNN** (plus **decision notes** when reality diverges from spec).
- **Context-index** and **repo-map** stay aligned with structural or ownership changes.
- **Workflow changes** (how the team works) should be visible in git history on `.agentic/` and governance, not only in chat.

### 6.1 Context-index vs “what changed” in the project

- **`context-index.md` is a catalog, not a changelog.** It lists context sources, purpose, and (when maintained) **status / last updated** per row. That supports **health and discovery**, not a chronological narrative of team-wide context changes.
- **Git history** on `.agentic/context/` and `.agentic/index/` is always available but is a poor onboarding story by itself; commits should still use **clear messages** when context meaningfully shifts.
- **Project-level context change visibility (pick at least one practice the team commits to):**
  - **PR descriptions** for context edits: 1–2 sentences on *why* (problem, decision); or
  - **Optional rolling log** — e.g. `.agentic/index/context-changelog.md` (newest first, brief entries for material changes); or
  - **Decision notes** in `.agentic/workflow/decisions/` for substantive shifts (architecture, constraints, governance interpretation).
- Small typo or formatting-only edits to context need not spawn a changelog line; use judgment consistent with traceability goals.

---

## 7. Context health (ops vs repo)

Extend the standard [context health report](../health/context-health-report.md) discipline with:

| Check | Requirement |
|-------|-------------|
| Repo vs `project-ops` / personal notes | List conflicts; **resolve toward committed `.agentic/`**. |
| Drift after manual coding | If code merged without agent, confirm **context sync procedure** was run. |
| AI tool instructions | Note if Cursor rules and Copilot instructions are **materially out of sync** (until automated). |

**Each developer** runs this scan when the team agrees (see §2.5).

---

## 8. Versioning and change visibility

### 8.1 Upstream toolkit (this repository)

- Record which **toolkit version** (or install git ref) the project’s `.agentic/` tree was last aligned with in **[`.agentic/README.md`](../README.md)** (alignment table at top).
- Breaking changes to install/bootstrap or team conventions shipped **from the toolkit repo** should be visible in that repo’s **[CHANGELOG.md](../../CHANGELOG.md)** (or release notes) and, for adopters, a short **migration note** when upgrades require manual steps.

### 8.2 Relationship to project context history

- **Toolkit CHANGELOG** answers: “What changed in the *template / installer* we pulled from?”
- **§6.1** answers: “What changed in *our project’s* shared context and why?” — do not rely on `context-index.md` alone for that story.

---

## 9. Summary checklist (acceptance for “Team Kit v1” in a project)

- [ ] Full `.agentic/` committed by default; exceptions documented.
- [ ] Governance changes via normal PR/agreement; no extra bureaucracy required beyond team norms.
- [ ] Policy: no casual manual edits to context/index summaries; brief/spec sign-off allowed; manual code ⇒ agent-led doc update procedure.
- [ ] `project-ops` / personal notes explicitly subordinate to repo; health checks include this dimension.
- [ ] `.cursor/rules` + `.github/copilot-instructions.md` (and optional `AGENTS.md` / `.github/instructions/`) documented and kept aligned as a team rule.
- [ ] PR prompt at `.agentic/team/prompts/pr-review-prompt.md` known to the team; manual authors run before PR or use `CONTEXT_SYNC.md` if no AI.
- [ ] Traceability expectations (§6) understood by the team.
- [ ] **Onboarding** — `.agentic/team/ONBOARDING.md` — entry path, human vs agent validation summary, “why this helps,” agent basics; **validation matrix** — `.agentic/workflow/WORKFLOW_VALIDATION.md` — explicit gates for agents and humans.
- [ ] **Project context change practice** agreed (§6.1): PR blurbs and/or optional `context-changelog.md` and/or decision notes for material edits — team knows `context-index` is not the changelog.
- [ ] Toolkit version / alignment recorded for the project (§8.1).

---

*Maintained as part of the Agentic Toolkit. Update when team policy changes.*
