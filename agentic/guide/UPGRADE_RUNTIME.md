# Upgrade Runtime

## What Is This?

Guide for upgrading an existing project runtime layer from the latest toolkit source.

## Why Does It Exist?

Toolkit source evolves. Runtime installations need safe, repeatable upgrades without losing project-specific data.

## Where Does It Run?

Run in toolkit source and target an independent project repo.

## When Do I Use It?

- after toolkit source updates
- when new templates/rules are introduced
- when runtime docs drift from current source standards

## Safe Upgrade Steps

### 1) Back up runtime folder

In project repo:

```bash
cp -R .agentic ".agentic.backup.$(date +%Y%m%d-%H%M%S)"
```

### 2) Re-install with force

From toolkit source:

```bash
./scripts/install-runtime.sh \
  --project-root "/path/to/my-project" \
  --runtime-dir ".agentic" \
  --profile full \
  --force
```

### 3) Review differences

In project repo:

```bash
git diff -- .agentic .cursor/rules
```

### 4) Re-apply local customizations

Check:

- package policy custom rules
- governance custom gates
- local rule edits
- any project-specific guide notes

### 5) Validate context source registry

Open:

`.agentic/context/context-source-registry.md`

Confirm owners, authority levels, and validation dates are still correct.

## Notes on Flexibility

If your runtime folder is not `.agentic`, pass `--runtime-dir`.
If your ops link is not `project-ops`, pass `--ops-link-name`.

---

*Upgrade intentionally. Keep project-specific operational artifacts in external project memory.*
