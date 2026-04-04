# End-to-End Example

## What Is This?

A complete example showing toolkit source, project runtime, and external operational memory working together.

## Why Does It Exist?

To remove ambiguity for first-time setup and make the 3-layer model concrete.

## Example Paths

- Toolkit source: `/Users/alex/tools/cursor-agentic-toolkit`
- Project runtime: `/Users/alex/work/my-project`
- External operational memory: `/Users/alex/project-memory/my-project-ops`

## 1) Install runtime

```bash
cd "/Users/alex/tools/cursor-agentic-toolkit"
./scripts/install-runtime.sh \
  --project-root "/Users/alex/work/my-project" \
  --runtime-dir ".agentic" \
  --ops-link-name "project-ops" \
  --ops-target "/Users/alex/project-memory/my-project-ops" \
  --profile full
```

## 2) Resulting runtime shape

```
/Users/alex/work/my-project/
  .agentic/
    context/
    index/
    workflow/
    human-tasks/
    guide/
    health/
    rules/
  project-ops -> /Users/alex/project-memory/my-project-ops
  src/
  package.json
```

## 3) Register external sources

In:

`.agentic/context/context-source-registry.md`

Add entries for:

- client input locations
- architecture documents
- compliance references
- research and release records in `project-ops`

## 4) Open Cursor in project runtime

Open:

`/Users/alex/work/my-project`

Start prompt:

> "Read `.agentic/index/context-index.md`, validate the source registry, and create a feature brief for [intent]."

---

*Use this pattern for every new project. Keep toolkit source and project runtime concerns separate.*
