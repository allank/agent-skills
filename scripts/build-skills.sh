#!/usr/bin/env bash
# Package every skill in this repo as dist/<skill-name>.skill for upload
# to Claude AI / Cowork (Settings -> Skills -> Add).
#
# A .skill file is a zip archive with the skill directory at its root:
#   <skill-name>/SKILL.md
#   <skill-name>/references/...
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$REPO_DIR/dist"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

echo "Building .skill packages into $DIST_DIR"
echo ""

built=0
for skill_dir in "$REPO_DIR"/plugins/*/skills/*/; do
  skill_name="$(basename "$skill_dir")"

  if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    echo "  Skipped: $skill_name (no SKILL.md)"
    continue
  fi

  if [[ -f "$DIST_DIR/$skill_name.skill" ]]; then
    echo "Error: duplicate skill name '$skill_name' across plugins" >&2
    exit 1
  fi

  (cd "$(dirname "$skill_dir")" && zip -q -r "$DIST_DIR/$skill_name.skill" "$skill_name" -x "*.DS_Store")
  echo "  Built: $skill_name.skill"
  built=$((built + 1))
done

echo ""
echo "Done: $built skills packaged."
