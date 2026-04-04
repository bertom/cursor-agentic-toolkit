# Repository Map

> Map of the **toolkit source repository only**.

## What Is This?

A map of reusable toolkit assets in this repo.

## Why Does It Exist?

To avoid confusion between toolkit source and real project runtime/memory layers.

## Where Does It Live?

`agentic/index/repo-map.md` in toolkit source.

## Source Structure

```
cursor-agentic-toolkit/
├── agentic/
│   ├── context/         # reusable runtime context templates
│   ├── workflow/        # reusable templates + example artifact folders
│   ├── human-tasks/     # reusable human task template/lanes
│   ├── guide/           # architecture/setup/how-to docs
│   ├── health/          # reusable health report template
│   ├── index/           # source index docs
│   └── rules/           # reusable behavior rules
├── .cursor/rules/       # reusable cursor rule set
├── scripts/             # installer/upgrade helper scripts
└── README.md
```

## Not Part of Source Architecture

The following are **runtime concepts**, not source folders:

- project runtime repo (`my-project/`)
- external project operational memory
- runtime `.agentic/` folder
- runtime `project-ops/` symlink

## Runtime Example (for reference)

```
my-project/
  .agentic/
  project-ops/ -> /external/project-memory/my-project
  src/
  package.json
```

---

*Update this map when toolkit source structure changes.*
