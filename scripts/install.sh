#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /path/to/shopify-theme" >&2
  exit 2
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_root="$(cd "$script_dir/.." && pwd)"
target_root="$1"

if [[ ! -d "$target_root" ]]; then
  echo "Target directory does not exist: $target_root" >&2
  exit 1
fi

target_root="$(cd "$target_root" && pwd)"
source_agents="$source_root/AGENTS.md"
source_skill="$source_root/.agents/skills/shopify-web-design"
target_agents="$target_root/AGENTS.md"
target_skills_root="$target_root/.agents/skills"
target_skill="$target_skills_root/shopify-web-design"

if [[ -f "$target_agents" ]] && ! cmp -s "$source_agents" "$target_agents"; then
  echo "A different AGENTS.md already exists at $target_agents." >&2
  echo "Merge it manually; this installer will not overwrite project instructions." >&2
  exit 1
fi

if [[ -e "$target_skill" ]]; then
  echo "The target skill already exists at $target_skill." >&2
  echo "Review and update it manually; this installer will not overwrite it." >&2
  exit 1
fi

if [[ ! -f "$target_agents" ]]; then
  cp "$source_agents" "$target_agents"
fi

mkdir -p "$target_skills_root"
cp -R "$source_skill" "$target_skill"

echo "Installed AGENTS.md and shopify-web-design into: $target_root"
echo "Start a new Codex session from the target repository root to load the skill."
