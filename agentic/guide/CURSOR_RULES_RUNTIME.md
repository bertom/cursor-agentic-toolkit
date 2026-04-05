# Cursor rules at runtime

## What is this?

Cursor only auto-loads project rules from:

`<project-root>/.cursor/rules/*.mdc`

It does **not** read rules from `.agentic/` or from the toolkit source repo unless that folder is your **opened workspace root**.

## Why it matters

The toolkit keeps canonical rule **sources** in this repository under `.cursor/rules/`.  
Those files are **templates**. They become effective only after they exist in **your project** at `.cursor/rules/`.

## What the installer does

`scripts/install-runtime.sh` copies toolkit `.cursor/rules/*.mdc` into:

`<your-project>/.cursor/rules/`

So when you open the project repo as the Cursor workspace root, agents get the rules automatically.

## When rules feel “missing”

| Situation | What to do |
|-----------|------------|
| You only cloned toolkit source, never ran the installer on the app repo | Run the installer with `--project-root` pointing at the app repo. |
| You hand-copied `.agentic/` but skipped `.cursor/rules/` | Re-run the installer, or copy `.cursor/rules/` from toolkit source into the project root. |
| Workspace root is a parent folder, not the app repo | Open the app folder as root, or add a multi-root workspace that includes the repo where `.cursor/rules/` lives. |
| You deleted or overwrote `.cursor/rules/` | Restore from toolkit source or re-run install with `--force` (review diffs first). |

## Should `.cursor/rules/` be committed?

**Usually yes** for teams: everyone gets the same agent behavior without re-running the installer.

If you prefer not to commit them, document that every developer must run the installer after clone, and add it to onboarding.

## Upgrades

When toolkit rules change, refresh the project copy:

- Re-run `install-runtime.sh` with `--force`, or  
- See [UPGRADE_RUNTIME.md](UPGRADE_RUNTIME.md).

---

*Update this guide if Cursor’s rule loading behavior or installer paths change.*
