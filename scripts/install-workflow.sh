#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-}"
if [[ -z "$TARGET_DIR" ]]; then
  echo "Usage: $0 <output-directory>" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$TARGET_DIR"
cp "$ROOT_DIR/templates/cron-job.json" "$TARGET_DIR/cron-job.json"
cp "$ROOT_DIR/templates/briefing-prompt.txt" "$TARGET_DIR/briefing-prompt.txt"

echo "Installed workflow template into: $TARGET_DIR"
echo "Next: customize the JSON values, then add the job with your Agent Harness scheduler tooling."
