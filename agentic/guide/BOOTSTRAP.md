# Bootstrap (Project Runtime)

## What Is This?

Bootstrap instructions for initializing the toolkit runtime inside an already opened project repository.

## Why Does It Exist?

To ensure `.agentic` is created correctly and external operational memory is linked consistently.

## Where Does It Run?

Run this in project runtime root (for example `my-project/`), not in toolkit source.

## When Do I Use It?

- first-time setup of a project
- re-bootstrap after runtime cleanup
- standard onboarding for a new team member

## How To Bootstrap

Default names used below:

- Runtime folder: `.agentic`
- Ops link: `project-ops`

Both are configurable.

### 1) Run installer script (recommended)

From toolkit source:

```bash
./scripts/install-runtime.sh \
  --project-root "/path/to/my-project" \
  --runtime-dir ".agentic" \
  --ops-link-name "project-ops" \
  --ops-target "/external/project-memory/my-project" \
  --profile full \
  --gitignore-mode recommended
```

Preview actions without writing:

```bash
./scripts/install-runtime.sh --project-root "/path/to/my-project" --profile full --dry-run
```

Installer default writes project `.gitignore` entries for runtime dir and ops link name.  
Use `--gitignore-mode none` to disable.

### 2) Manual bootstrap (if script is not used)

Create runtime layer:

```bash
mkdir -p .agentic/context .agentic/index .agentic/workflow .agentic/human-tasks
```

### 3) Copy toolkit runtime assets

From toolkit source, copy templates/guides needed in runtime:

- `agentic/context/*` (as runtime starters)
- `agentic/workflow/templates/*`
- `agentic/rules/*` and relevant `.cursor/rules/*`

### 4) Create context source registry

Create:

`.agentic/context/context-source-registry.md`

Use:

`agentic/context/context-source-registry-template.md` from toolkit source.

### 5) Link external operational memory (recommended)

```bash
ln -s /external/project-memory/my-project project-ops
```

### 6) Register external source ownership

In `.agentic/context/context-source-registry.md`:

- list each external source
- record owner
- set validation date
- mark authority level

### 7) Open Cursor in runtime root

Open `my-project/` and start workflow from there.

## Expected Runtime State

```
my-project/
  .agentic/
    context/
    workflow/
    index/
    human-tasks/
  project-ops/ -> /external/project-memory/my-project
```

---

*Bootstrap defines runtime setup only. Toolkit source remains reusable and project-agnostic.*
