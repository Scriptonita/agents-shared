#!/usr/bin/env bash
# Links every shared skill into ~/.claude/skills/ so a `git pull` (or
# `git submodule update --remote agents`) updates them in place.
#
# Idempotent. An existing copy of a skill is backed up and replaced by a
# symlink; a non-symlink folder that does not look like a copy is left alone
# unless --force is given.
set -euo pipefail

force=0
for arg in "$@"; do
  case "$arg" in
    --force) force=1 ;;
    -h|--help)
      echo "Usage: $0 [--force]"
      echo "  --force  back up and replace existing non-symlink skill folders"
      exit 0
      ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
dest_dir="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$dest_dir"

linked=0 unchanged=0 migrated=0 skipped=0
stamp="$(date +%Y%m%d-%H%M%S)"

for skill_md in "$src_dir"/*/SKILL.md; do
  [ -e "$skill_md" ] || continue
  skill_path="$(dirname "$skill_md")"
  name="$(basename "$skill_path")"
  target="$dest_dir/$name"

  if [ -L "$target" ]; then
    current="$(cd "$target" 2>/dev/null && pwd -P || true)"
    if [ "$current" = "$skill_path" ]; then
      unchanged=$((unchanged + 1))
      continue
    fi
    ln -sfn "$skill_path" "$target"
    echo "relinked  $name -> $skill_path"
    linked=$((linked + 1))
    continue
  fi

  if [ -e "$target" ]; then
    # A folder whose SKILL.md declares the same name is treated as an old copy.
    if [ "$force" -eq 1 ] || { [ -f "$target/SKILL.md" ] && grep -qE "^name:[[:space:]]*$name[[:space:]]*$" "$target/SKILL.md"; }; then
      mv "$target" "$target.bak-$stamp"
      ln -s "$skill_path" "$target"
      echo "migrated  $name (old copy kept at $name.bak-$stamp)"
      migrated=$((migrated + 1))
    else
      echo "WARNING   $name: $target exists and is not a symlink to this repo; left untouched (use --force to replace it)" >&2
      skipped=$((skipped + 1))
    fi
    continue
  fi

  ln -s "$skill_path" "$target"
  echo "linked    $name"
  linked=$((linked + 1))
done

echo "Done: $linked linked, $migrated migrated, $unchanged unchanged, $skipped skipped (in $dest_dir)."
[ "$linked" -eq 0 ] && [ "$migrated" -eq 0 ] || echo "Restart Claude Code to load the new skills."
