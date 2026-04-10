# Quickstart

Use this after reading [EXTERNAL_SETUP.md](EXTERNAL_SETUP.md).

## What Is This?

A short sequence to start using the toolkit inside an independent project repo.

## Why Does It Exist?

To get you from zero to first feature quickly, without mixing toolkit source and project runtime responsibilities.

## Where Does It Live?

This guide lives in toolkit source, but the runtime work happens in your project repo.

## Steps

### 1) Install runtime assets

Run installer from toolkit source:

```bash
./scripts/install-runtime.sh --project-root "/path/to/my-project" --profile full
```

### 2) Open the project runtime in Cursor

Open `my-project/` (not toolkit source).

After install, read `.agentic/team/ONBOARDING.md` if you are new (`guide/` and `.agentic/rules/` links inside it need **full** profile). Use `.agentic/workflow/WORKFLOW_VALIDATION.md` for stage-by-stage checks. Before a PR (especially manual coding), use `.agentic/team/prompts/pr-review-prompt.md` (paste or `@`-mention) or `.agentic/team/CONTEXT_SYNC.md` if you use no AI. Record toolkit ref in `.agentic/README.md`.

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
