# Glossary

Terms used throughout the Agentic Toolkit, defined in plain language.

| Term | Definition |
|------|-----------|
| **Agentic Toolkit** | The reusable source system of templates, rules, and guides for agent-assisted development. |
| **Toolkit Source** | This repository; reusable assets only, not live project workspaces. |
| **Project Runtime** | An independent project repo where Cursor is opened for daily coding (e.g., `my-project/`). |
| **Runtime Layer (`.agentic`)** | Local runtime folder used for context summaries, rules, and control files. |
| **Project Operational Memory (`project-ops`)** | External project-specific memory holding specs/tasks/QA/client input/research/release docs. |
| **Ops Symlink** | `my-project/project-ops` symlink to external operational memory path. |
| **Layered Architecture** | The 3-layer model: toolkit source, project runtime, project operational memory. |
| **Workflow Chain** | Intent → Feature Brief → Spec → Decision Note → Task Pack → Implementation → QA Report → Documentation Update. |
| **Artifact** | Any workflow document: feature brief, spec, decision note, task pack, or QA report. |
| **Context** | Curated project information agents must read before making decisions. |
| **Context Health** | Assessment of context completeness, freshness, and consistency. |
| **Context Index** | Catalog of available context sources and their status. |
| **Repo Map** | High-level map of source or runtime structure, depending on location. |
| **Human Task** | A task requiring human action (dashboard/API keys/compliance approvals/etc.). |
| **Package Policy** | Rules for dependencies: preferred packages, discouraged options, approval gates. |
| **Project Mode** | `new`, `active`, `mature`, or `legacy`; controls strictness and caution level. |
| **QA Gate** | Required quality validation checkpoint before work is complete. |
| **QA Report** | Record of validation steps and outcomes for a task pack. |
| **Traceability** | Ability to navigate artifact links from implementation back to intent. |
| **Governance** | Policies covering git, security, permissions, and approval gates. |
| **Approval Gate** | Action requiring explicit human approval before agent proceeds. |
| **Toolkit Version** | Semantic version tracking toolkit-source evolution. |

---

*This document is maintained by the Agentic Toolkit. Add new terms as the system evolves.*
