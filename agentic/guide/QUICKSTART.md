# Quickstart

Use this after reading [EXTERNAL_SETUP.md](EXTERNAL_SETUP.md).

## What Is This?

A short sequence to start using the toolkit inside an independent project repo.

## Why Does It Exist?

To get you from zero to first feature quickly, without mixing toolkit source and project runtime responsibilities.

## Where Does It Live?

This guide lives in toolkit source, but the runtime work happens in your project repo.

## Steps

### Team Kit (do this if you work with others)

After install, **commit `.agentic/`** (default installer gitignore supports this). Then:

1. Read **`.agentic/team/ONBOARDING.md`** — includes the **start prompt** for new chats.
2. Use **`.agentic/workflow/WORKFLOW_VALIDATION.md`** during the chain.
3. Before PR: **`.agentic/team/prompts/pr-review-prompt.md`** or **`.agentic/team/CONTEXT_SYNC.md`** (no AI).
4. Align Copilot: **`.agentic/team/AI_INSTRUCTIONS_SYNC.md`**.

Full policy: **`.agentic/team/TEAM_KIT_V1_REQUIREMENTS.md`**.

### 1) Install runtime assets

Run installer from toolkit source:

```bash
./scripts/install-runtime.sh --project-root "/path/to/my-project" --profile full
```

### 2) Open the project runtime in Cursor

Open `my-project/` (not toolkit source).

If you skipped the **Team Kit** block above: read `.agentic/team/ONBOARDING.md` when new (`guide/` and `.agentic/rules/` links need **full** profile). Record the toolkit ref in `.agentic/README.md`.

### 3) Ensure runtime layer exists

In project root:

```bash
mkdir -p .agentic
```

### 4) Ensure external operational memory is linked

In project root:

```bash
ln -s /external/project-memory/my-project project-ops
```

### 5) Initialize runtime context

Use agent prompt:

> "Set up `.agentic` context for this project and register `project-ops` as external operational memory."

### 6) Start first feature

Use agent prompt:

> "Create a feature brief for [intent], then propose a spec."

## When Do I Use This?

- first install on a project
- onboarding a teammate
- re-initializing `.agentic` runtime layer
- using custom runtime/ops folder names (supported)

---

*This document is maintained by the Agentic Toolkit.*
