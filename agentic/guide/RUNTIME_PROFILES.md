# Runtime Profiles

## What Is This?

Defines runtime installation profiles for project repositories.

## Why Does It Exist?

Some teams want fast startup with minimal docs. Others want full governance and QA structure from day one.

## Where Does It Apply?

Project runtime repo (for example `my-project/`) after toolkit install.

## Profiles

### `minimal`

Use when:

- team is piloting toolkit adoption
- project is small and fast-moving
- low process overhead is preferred initially

Installs:

- runtime context files
- context source registry
- runtime index files
- workflow templates only

### `full`

Use when:

- project has multiple contributors
- compliance/governance matters
- you want complete workflow + QA + human-task lanes

Installs:

- everything in `minimal`
- workflow artifact folders
- human task templates/lanes
- health report template
- runtime rules and guide files
- Cursor rule files in project `.cursor/rules/`

## How To Choose

- Start with `minimal` if unsure.
- Move to `full` when work volume or risk increases.

## Script Usage

```bash
./scripts/install-runtime.sh \
  --project-root "/path/to/my-project" \
  --profile minimal
```

```bash
./scripts/install-runtime.sh \
  --project-root "/path/to/my-project" \
  --profile full
```

---

*Profiles tune setup complexity; the 3-layer model stays the same.*
