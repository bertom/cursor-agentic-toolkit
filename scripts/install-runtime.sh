#!/usr/bin/env bash
set -euo pipefail

# Installs toolkit runtime assets into an independent project repository.
# Defaults:
# - runtime dir: .agentic
# - ops link name: project-ops
# - gitignore-mode: committed (.agentic tracked; ops link name ignored)
# Use --help for options.

usage() {
  cat <<'EOF'
Usage:
  scripts/install-runtime.sh --project-root <path> [options]

Options:
  --project-root <path>     Project runtime repository root (required)
  --toolkit-root <path>     Toolkit source root (default: script parent/..)
  --runtime-dir <name>      Runtime folder name/path in project root (default: .agentic)
  --ops-link-name <name>    Symlink name in project root (default: project-ops)
  --ops-target <path>       External project operational memory path (optional)
  --profile <minimal|full>  Runtime profile (default: full)
  --gitignore-mode <mode>   Gitignore policy: committed|recommended|none (default: committed)
                            committed   = ignore ops link name only (.agentic is tracked; team default)
                            recommended = ignore runtime dir + ops link (e.g. public repo, private .agentic)
                            none        = do not modify .gitignore
  --force                   Overwrite existing runtime files
  --dry-run                 Preview actions without writing changes
  --help                    Show this help
EOF
}

die() {
  echo "Error: $*" >&2
  exit 1
}

require_dir() {
  [[ -d "$1" ]] || die "Directory not found: $1"
}

copy_file() {
  local src="$1"
  local dst="$2"
  if [[ -e "$dst" && "$FORCE" != "1" ]]; then
    log "unchanged (file exists; use --force to overwrite): $dst"
    return
  fi
  run "mkdir -p \"$(dirname "$dst")\""
  run "cp \"$src\" \"$dst\""
}

log() {
  echo "$*"
}

run() {
  local cmd="$1"
  if [[ "$DRY_RUN" == "1" ]]; then
    log "[dry-run] $cmd"
  else
    eval "$cmd"
  fi
}

ensure_gitignore_entry() {
  local gitignore_file="$1"
  local entry="$2"

  if [[ -f "$gitignore_file" ]]; then
    while IFS= read -r line; do
      if [[ "$line" == "$entry" ]]; then
        log "gitignore already has: $entry"
        return
      fi
    done < "$gitignore_file"
  fi

  if [[ "$DRY_RUN" == "1" ]]; then
    log "[dry-run] append to $gitignore_file: $entry"
    return
  fi

  touch "$gitignore_file"
  echo "$entry" >> "$gitignore_file"
}

PROJECT_ROOT=""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
RUNTIME_DIR=".agentic"
OPS_LINK_NAME="project-ops"
OPS_TARGET=""
PROFILE="full"
GITIGNORE_MODE="committed"
FORCE="0"
DRY_RUN="0"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-root) PROJECT_ROOT="${2:-}"; shift 2 ;;
    --toolkit-root) TOOLKIT_ROOT="${2:-}"; shift 2 ;;
    --runtime-dir) RUNTIME_DIR="${2:-}"; shift 2 ;;
    --ops-link-name) OPS_LINK_NAME="${2:-}"; shift 2 ;;
    --ops-target) OPS_TARGET="${2:-}"; shift 2 ;;
    --profile) PROFILE="${2:-}"; shift 2 ;;
    --gitignore-mode) GITIGNORE_MODE="${2:-}"; shift 2 ;;
    --force) FORCE="1"; shift ;;
    --dry-run) DRY_RUN="1"; shift ;;
    --help) usage; exit 0 ;;
    *) die "Unknown option: $1" ;;
  esac
done

[[ -n "$PROJECT_ROOT" ]] || { usage; die "--project-root is required"; }
[[ "$PROFILE" == "minimal" || "$PROFILE" == "full" ]] || die "--profile must be minimal or full"
[[ "$GITIGNORE_MODE" == "committed" || "$GITIGNORE_MODE" == "recommended" || "$GITIGNORE_MODE" == "none" ]] || die "--gitignore-mode must be committed, recommended, or none"

require_dir "$PROJECT_ROOT"
require_dir "$TOOLKIT_ROOT"
require_dir "$TOOLKIT_ROOT/agentic"

RUNTIME_ROOT="${PROJECT_ROOT%/}/${RUNTIME_DIR}"

run "mkdir -p \"$RUNTIME_ROOT/context\" \"$RUNTIME_ROOT/index\" \"$RUNTIME_ROOT/workflow/templates\" \"$RUNTIME_ROOT/human-tasks\""
run "mkdir -p \"$RUNTIME_ROOT/human-tasks/pending\" \"$RUNTIME_ROOT/human-tasks/completed\""
if [[ "$PROFILE" == "full" ]]; then
  run "mkdir -p \
    \"$RUNTIME_ROOT/workflow/briefs\" \
    \"$RUNTIME_ROOT/workflow/specs\" \
    \"$RUNTIME_ROOT/workflow/decisions\" \
    \"$RUNTIME_ROOT/workflow/tasks\" \
    \"$RUNTIME_ROOT/workflow/qa\" \
    \"$RUNTIME_ROOT/guide\" \
    \"$RUNTIME_ROOT/health\" \
    \"$RUNTIME_ROOT/rules\""
fi

# Core context files
for f in business-context.md client-input.md technical-context.md constraints.md package-policy.md governance.md; do
  copy_file "$TOOLKIT_ROOT/agentic/context/$f" "$RUNTIME_ROOT/context/$f"
done
copy_file \
  "$TOOLKIT_ROOT/agentic/context/context-source-registry-template.md" \
  "$RUNTIME_ROOT/context/context-source-registry.md"

# Core index files
copy_file "$TOOLKIT_ROOT/agentic/index/context-index.md" "$RUNTIME_ROOT/index/context-index.md"
copy_file "$TOOLKIT_ROOT/agentic/index/repo-map.md" "$RUNTIME_ROOT/index/repo-map.md"
copy_file "$TOOLKIT_ROOT/agentic/index/context-changelog.md" "$RUNTIME_ROOT/index/context-changelog.md"

# Core workflow templates
for f in feature-brief-template.md spec-template.md decision-note-template.md task-pack-template.md qa-report-template.md; do
  copy_file "$TOOLKIT_ROOT/agentic/workflow/templates/$f" "$RUNTIME_ROOT/workflow/templates/$f"
done

copy_file "$TOOLKIT_ROOT/agentic/workflow/WORKFLOW_VALIDATION.md" "$RUNTIME_ROOT/workflow/WORKFLOW_VALIDATION.md"

copy_file "$TOOLKIT_ROOT/agentic/README.md" "$RUNTIME_ROOT/README.md"

run "mkdir -p \"$RUNTIME_ROOT/team/prompts\" \"$RUNTIME_ROOT/team/templates\""
if [[ -d "$TOOLKIT_ROOT/agentic/team" ]]; then
  for t in "$TOOLKIT_ROOT"/agentic/team/*.md; do
    [[ -f "$t" ]] || continue
    copy_file "$t" "$RUNTIME_ROOT/team/$(basename "$t")"
  done
  if [[ -d "$TOOLKIT_ROOT/agentic/team/prompts" ]]; then
    for p in "$TOOLKIT_ROOT"/agentic/team/prompts/*.md; do
      [[ -f "$p" ]] || continue
      copy_file "$p" "$RUNTIME_ROOT/team/prompts/$(basename "$p")"
    done
  fi
  if [[ -d "$TOOLKIT_ROOT/agentic/team/templates" ]]; then
    for s in "$TOOLKIT_ROOT"/agentic/team/templates/*; do
      [[ -f "$s" ]] || continue
      copy_file "$s" "$RUNTIME_ROOT/team/templates/$(basename "$s")"
    done
  fi
fi

if [[ "$PROFILE" == "full" ]]; then
  copy_file "$TOOLKIT_ROOT/agentic/human-tasks/human-task-template.md" "$RUNTIME_ROOT/human-tasks/human-task-template.md"
  copy_file "$TOOLKIT_ROOT/agentic/health/context-health-report.md" "$RUNTIME_ROOT/health/context-health-report.md"
  copy_file "$TOOLKIT_ROOT/agentic/rules/agent-behavior.md" "$RUNTIME_ROOT/rules/agent-behavior.md"

  if [[ -d "$TOOLKIT_ROOT/agentic/guide" ]]; then
    run "mkdir -p \"$RUNTIME_ROOT/guide\""
    for g in "$TOOLKIT_ROOT"/agentic/guide/*.md; do
      [[ -f "$g" ]] || continue
      copy_file "$g" "$RUNTIME_ROOT/guide/$(basename "$g")"
    done
  fi

fi

# Optional Cursor rules install in project runtime
if [[ -d "$TOOLKIT_ROOT/.cursor/rules" ]]; then
  run "mkdir -p \"$PROJECT_ROOT/.cursor/rules\""
  for r in "$TOOLKIT_ROOT"/.cursor/rules/*.mdc; do
    [[ -f "$r" ]] || continue
    copy_file "$r" "$PROJECT_ROOT/.cursor/rules/$(basename "$r")"
  done
fi

# GitHub Copilot (VS Code) — thin repo instructions (see agentic/team/AI_INSTRUCTIONS_SYNC.md)
if [[ -f "$TOOLKIT_ROOT/agentic/team/copilot-instructions.project.md" ]]; then
  run "mkdir -p \"$PROJECT_ROOT/.github\""
  copy_file "$TOOLKIT_ROOT/agentic/team/copilot-instructions.project.md" "$PROJECT_ROOT/.github/copilot-instructions.md"
fi

# Optional external ops symlink
if [[ -n "$OPS_TARGET" ]]; then
  require_dir "$OPS_TARGET"
  link_path="$PROJECT_ROOT/$OPS_LINK_NAME"
  if [[ -L "$link_path" ]]; then
    current_target="$(readlink "$link_path" || true)"
    if [[ "$current_target" == "$OPS_TARGET" ]]; then
      log "ops link already points to target: $link_path -> $OPS_TARGET"
    elif [[ "$FORCE" == "1" ]]; then
      run "rm -f \"$link_path\""
      run "ln -s \"$OPS_TARGET\" \"$link_path\""
    else
      die "Symlink exists with different target: $link_path -> $current_target (expected $OPS_TARGET; use --force to replace)"
    fi
  elif [[ -e "$link_path" ]]; then
    if [[ "$FORCE" == "1" ]]; then
      run "rm -rf \"$link_path\""
      run "ln -s \"$OPS_TARGET\" \"$link_path\""
    else
      die "Path already exists (not a symlink): $link_path (use --force to replace)"
    fi
  else
    run "ln -s \"$OPS_TARGET\" \"$link_path\""
  fi
fi

# Runtime git hygiene policy in project repo
if [[ "$GITIGNORE_MODE" == "committed" || "$GITIGNORE_MODE" == "recommended" ]]; then
  gitignore_file="$PROJECT_ROOT/.gitignore"
  if [[ "$GITIGNORE_MODE" == "committed" ]]; then
    ensure_gitignore_entry "$gitignore_file" "$OPS_LINK_NAME"
  else
    runtime_ignore="${RUNTIME_DIR%/}/"
    ensure_gitignore_entry "$gitignore_file" "$runtime_ignore"
    ensure_gitignore_entry "$gitignore_file" "$OPS_LINK_NAME"
  fi
fi

cat <<EOF
Runtime installation complete.
- project root: $PROJECT_ROOT
- runtime dir:  $RUNTIME_ROOT
- profile:      $PROFILE
- ops link:     ${OPS_TARGET:+$PROJECT_ROOT/$OPS_LINK_NAME -> $OPS_TARGET}
- gitignore:    $GITIGNORE_MODE
- dry run:      $([[ "$DRY_RUN" == "1" ]] && echo yes || echo no)

Next:
1) Cursor: open project root (rules: $PROJECT_ROOT/.cursor/rules/).
2) VS Code + Copilot: $PROJECT_ROOT/.github/copilot-instructions.md — keep aligned with Cursor via $RUNTIME_ROOT/team/AI_INSTRUCTIONS_SYNC.md
3) Validation matrix: $RUNTIME_ROOT/workflow/WORKFLOW_VALIDATION.md — onboarding: $RUNTIME_ROOT/team/ONBOARDING.md (full profile needed for guide/ and rules/ links inside ONBOARDING)
4) Validate context source registry at:
   $RUNTIME_ROOT/context/context-source-registry.md
5) Full profile: start a feature brief in $RUNTIME_ROOT/workflow/briefs/ (create folder if you used minimal).
6) If .cursor/rules is missing, re-run this script or copy from toolkit source (see agentic/guide/CURSOR_RULES_RUNTIME.md).
7) Before PR (optional): $RUNTIME_ROOT/team/prompts/pr-review-prompt.md — especially for manual-only coding.
EOF
