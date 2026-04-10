# Keeping Cursor rules and Copilot instructions aligned

**Toolkit source repo:** `cursor-agentic-toolkit` does **not** need `.github/copilot-instructions.md`. Copilot instructions are created **only in application repos** when you run `install-runtime.sh` (from `agentic/team/copilot-instructions.project.md`).

## The problem

- **Cursor** loads **`.cursor/rules/*.mdc`** from the **project root**.
- **GitHub Copilot** (VS Code) loads **`.github/copilot-instructions.md`** (repository-wide custom instructions).

They do **not** read each other. If you duplicate long rules in both places, they **will** drift.

## Single source of truth (recommended)

| Layer | Role |
|-------|------|
| **`.agentic/`** | Facts: `rules/agent-behavior.md`, `workflow/WORKFLOW_VALIDATION.md`, `context/*`, `team/*` |
| **`.cursor/rules/`** | Cursor-specific packaging (always-on globs, MDC frontmatter, workflow triggers) |
| **`.github/copilot-instructions.md`** | **Thin** summary + “read these paths first” — deployed from toolkit **`agentic/team/copilot-instructions.project.md`** |

**Rule of thumb:** Put **new** behavioral rules in **`agentic/rules/agent-behavior.md`** (or workflow docs) when possible; adjust **`.cursor/rules`** only for Cursor mechanics; adjust **`.github/copilot-instructions.md`** only when Copilot users need an explicit pointer or a Copilot-specific one-liner.

## What the installer does

`install-runtime.sh` copies:

- `.cursor/rules/*.mdc` from toolkit → project root  
- **`agentic/team/copilot-instructions.project.md`** → **`.github/copilot-instructions.md`** (creates `.github/` if needed; skips if file exists unless `--force`)

After upgrading the toolkit, re-run install with `--force` **only** if you intend to overwrite the project’s Copilot file (review diff first — teams may have customized it).

## Human checklist (when you change AI behavior)

Use when editing **toolkit rules**, **agent-behavior**, or **workflow validation**:

- [ ] **`.agentic/rules/agent-behavior.md`** (or relevant `.agentic/` doc) updated  
- [ ] **`.cursor/rules/*.mdc`** updated if Cursor-specific wording or triggers changed  
- [ ] **`.github/copilot-instructions.md`** still accurate — or refresh from `agentic/team/copilot-instructions.project.md` and re-apply local tweaks  
- [ ] Optional: run **PR review prompt** (`.agentic/team/prompts/pr-review-prompt.md`) before PR  

## Periodic check

Fill the **Team Kit alignment** row in `.agentic/health/context-health-report.md`: Cursor vs Copilot materially in sync?

## Future automation (optional)

A CI job could fail if `copilot-instructions.md` is older than `agent-behavior.md` or if required phrases are missing — not shipped in the toolkit by default.

## Official Copilot docs

- [Use custom instructions in VS Code](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)  
- [Repository custom instructions](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)
