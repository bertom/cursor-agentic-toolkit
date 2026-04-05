# External Setup

## What Is This?

Step-by-step setup for installing the toolkit into an independent project repository while keeping project operational memory external.

## Why Does It Exist?

To keep:

- toolkit source reusable
- project runtime clean
- project operational memory outside product git history

## Where Does This Run?

Run these steps against a **real project repository** (not toolkit source repo).

## Setup Flow

Recommended defaults:

- runtime folder: `.agentic`
- ops link name: `project-ops`

You can rename both to fit team conventions.

### 1) Choose/Create Project Runtime Repo

Example:

```bash
git clone <your-project-repo-url> my-project
cd my-project
```

### 2) Install Runtime Layer

Option A (recommended): scripted install from toolkit source

```bash
"/path/to/cursor-agentic-toolkit/scripts/install-runtime.sh" \
  --project-root "$(pwd)" \
  --runtime-dir ".agentic" \
  --profile full \
  --gitignore-mode recommended
```

Preview first:

```bash
"/path/to/cursor-agentic-toolkit/scripts/install-runtime.sh" \
  --project-root "$(pwd)" \
  --profile full \
  --dry-run
```

Option B: manual setup

Create local runtime folder:

```bash
mkdir -p .agentic
```

Copy toolkit assets from toolkit source into `.agentic`:

- context templates
- workflow templates
- rules/guides needed at runtime

### 3) Create External Operational Memory

Choose external location (example):

```bash
mkdir -p /external/project-memory/my-project
```

### 4) Link Operational Memory into Runtime (optional but recommended)

From project root:

```bash
ln -s /external/project-memory/my-project project-ops
```

Or with custom link name:

```bash
ln -s /external/project-memory/my-project ops-memory
```

Now runtime can reference (adjust link name if customized):

- `project-ops/specs/`
- `project-ops/tasks/`
- `project-ops/qa/`
- `project-ops/client-input/`
- `project-ops/research/`

### 5) Register Sources in Runtime Docs

In `.agentic/context/`:

- fill technical context
- add context source registry entries for external sources
- note ownership and last validation date

### 6) Open Cursor in Runtime Root

Open `my-project/` in Cursor for daily work.

Do **not** open toolkit source for day-to-day project implementation.

### Cursor rules (auto-load contract)

Cursor loads agent rules from **`my-project/.cursor/rules/*.mdc`**, not from `.agentic/`.  
The installer copies rules from toolkit source into that folder. If agents seem to ignore the toolkit, confirm the project root is the workspace root and that `.cursor/rules/` exists. See [CURSOR_RULES_RUNTIME.md](CURSOR_RULES_RUNTIME.md).

### 7) Confirm project git hygiene

Installer default policy adds runtime ignore entries in project `.gitignore`:

- `.agentic/` (or custom runtime dir)
- `project-ops` (or custom ops link name)

If you do not want installer to update `.gitignore`, run with:

`--gitignore-mode none`

## Example Structures

### Toolkit Source (reference only)

```
cursor-agentic-toolkit/
  agentic/
  .cursor/rules/
```

### Project Runtime (daily use)

```
my-project/
  .agentic/
  project-ops -> /external/project-memory/my-project
  src/
  package.json
```

### External Project Operational Memory

```
/external/project-memory/my-project/
  specs/
  tasks/
  qa/
  client-input/
  business/
  research/
  releases/
```

## Notes

- Runtime folder name is flexible (`.agentic` recommended).
- Ops link/folder name is flexible (`project-ops` recommended).
- `.agentic/` is runtime control/config/context summary layer.
- `project-ops/` is the full operational chain.
- Keep project runtime repo focused on product code and essential runtime metadata.

---

*Use this guide whenever onboarding a new project onto the toolkit.*
