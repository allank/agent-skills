#!/usr/bin/env bash
# Deploy skills from this repo to Antigravity via symlinks.
#
# The Antigravity skill path is in flux — verify with: agy inspect
# Override: AGY_SKILLS_DIR=~/.agents/skills ./scripts/deploy-antigravity.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGY_SKILLS_DIR="${AGY_SKILLS_DIR:-$HOME/.gemini/skills}"

mkdir -p "$AGY_SKILLS_DIR"

echo "Deploying skills from $REPO_DIR"
echo "Target: $AGY_SKILLS_DIR"
echo ""

for skill_dir in "$REPO_DIR"/plugins/*/skills/*/; do
  skill_name="$(basename "$skill_dir")"
  ln -sfn "$skill_dir" "$AGY_SKILLS_DIR/$skill_name"
  echo "  Linked: $skill_name"
done

echo ""
echo "Verify with: agy inspect"
