#!/usr/bin/env bash
set -euo pipefail

# Installs toolkit runtime assets into an independent project repository.
# Defaults:
# - runtime dir: .agentic
# - ops link name: project-ops
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
  --gitignore-mode <mode>   Gitignore policy: recommended|none (default: recommended)
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
    log "skip existing file: $dst"
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
GITIGNORE_MODE="recommended"
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
[[ "$GITIGNORE_MODE" == "recommended" || "$GITIGNORE_MODE" == "none" ]] || die "--gitignore-mode must be recommended or none"

require_dir "$PROJECT_ROOT"
require_dir "$TOOLKIT_ROOT"
require_dir "$TOOLKIT_ROOT/agentic"

RUNTIME_ROOT="${PROJECT_ROOT%/}/${RUNTIME_DIR}"

run "mkdir -p \"$RUNTIME_ROOT/context\" \"$RUNTIME_ROOT/index\" \"$RUNTIME_ROOT/workflow/templates\" \"$RUNTIME_ROOT/human-tasks\""
if [[ "$PROFILE" == "full" ]]; then
  run "mkdir -p \
    \"$RUNTIME_ROOT/workflow/briefs\" \
    \"$RUNTIME_ROOT/workflow/specs\" \
    \"$RUNTIME_ROOT/workflow/decisions\" \
    \"$RUNTIME_ROOT/workflow/tasks\" \
    \"$RUNTIME_ROOT/workflow/qa\" \
    \"$RUNTIME_ROOT/human-tasks/pending\" \
    \"$RUNTIME_ROOT/human-tasks/completed\" \
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

# Core workflow templates
for f in feature-brief-template.md spec-template.md decision-note-template.md task-pack-template.md qa-report-template.md; do
  copy_file "$TOOLKIT_ROOT/agentic/workflow/templates/$f" "$RUNTIME_ROOT/workflow/templates/$f"
done

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

# Optional external ops symlink
if [[ -n "$OPS_TARGET" ]]; then
  require_dir "$OPS_TARGET"
  link_path="$PROJECT_ROOT/$OPS_LINK_NAME"
  if [[ -L "$link_path" || -e "$link_path" ]]; then
    if [[ "$FORCE" == "1" ]]; then
      run "rm -rf \"$link_path\""
    else
      die "Path already exists: $link_path (use --force to replace)"
    fi
  fi
  run "ln -s \"$OPS_TARGET\" \"$link_path\""
fi

# Runtime git hygiene policy in project repo
if [[ "$GITIGNORE_MODE" == "recommended" ]]; then
  gitignore_file="$PROJECT_ROOT/.gitignore"
  runtime_ignore="${RUNTIME_DIR%/}/"
  ensure_gitignore_entry "$gitignore_file" "$runtime_ignore"
  ensure_gitignore_entry "$gitignore_file" "$OPS_LINK_NAME"
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
1) Open project root in Cursor.
2) Validate context source registry at:
   $RUNTIME_ROOT/context/context-source-registry.md
3) Start with a feature brief in:
   $RUNTIME_ROOT/workflow/briefs/
EOF
