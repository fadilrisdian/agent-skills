#!/usr/bin/env bash
# Install every skill in skills/ by symlinking it into ~/.claude/skills,
# so edits in this repo take effect immediately.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
dest="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$dest"

for skill in "$repo"/skills/*/*/; do
  skill="${skill%/}"
  [ -f "$skill/SKILL.md" ] || continue
  link="$dest/$(basename "$skill")"
  if [ -e "$link" ] && [ ! -L "$link" ]; then
    echo "skip (exists, not a symlink): $link"; continue
  fi
  ln -sfn "$skill" "$link"
  echo "linked: $link -> $skill"
done
