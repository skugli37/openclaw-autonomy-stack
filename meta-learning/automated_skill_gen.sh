#!/usr/bin/env bash
# Automated skill generation
set -euo pipefail

LEARNINGS_FILE="/home/kugli/.openclaw/workspace/.learnings/LEARNINGS.md"
SKILLS_DIR="/home/kugli/.openclaw/skills"

echo "=== Automated Skill Generation ==="
echo "Scanning learnings for new skills..."

if [[ ! -f "$LEARNINGS_FILE" ]]; then
  echo "No learnings file found"
  exit 0
fi

# Extract skills from learnings
grep -A 20 "promoted_to_skill\|pending" "$LEARNINGS_FILE" | while IFS= read -r line; do
  if [[ "$line" == *"Skill-Path:"* ]]; then
    SKILL="${line#*Skill-Path: }"
    echo "Found skill: $SKILL"
    # Create if not exists
    if [[ ! -d "$SKILLS_DIR/$SKILL" ]]; then
      mkdir -p "$SKILLS_DIR/$SKILL"
      echo "  -> Created skill directory"
    fi
  fi
done

echo "Skill generation complete"
