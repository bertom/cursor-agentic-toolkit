# QA Reports

Quality assurance reports for a task pack batch. Prefer **one file per batch**, opened when the pack is approved (or on first QA action), with an **incremental log** updated as checks run and fixes land—then consolidated when implementation is complete. Work is not considered done until the report passes.

**Naming:** `QA-NNN-<slug>.md` or `QA-<YYYY-MM-DD>-<slug>.md` (see `.cursor/rules/qa-checks.mdc`)

**Template:** [`../templates/qa-report-template.md`](../templates/qa-report-template.md)

**References:** Must link to its parent task pack (`TP-NNN`), spec (`SP-NNN`), and feature brief (`FB-NNN`).
