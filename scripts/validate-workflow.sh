#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

for f in \
  "$ROOT_DIR/README.md" \
  "$ROOT_DIR/templates/cron-job.json" \
  "$ROOT_DIR/templates/briefing-prompt.txt" \
  "$ROOT_DIR/scripts/install-workflow.sh" \
  "$ROOT_DIR/scripts/validate-workflow.sh" \
  "$ROOT_DIR/scripts/render-template.js"
do
  [[ -f "$f" ]] || { echo "Missing required file: $f" >&2; exit 1; }
done

node -e "JSON.parse(require('fs').readFileSync('$ROOT_DIR/templates/cron-job.json','utf8'))"
node -c "$ROOT_DIR/scripts/render-template.js" >/dev/null

echo "daily-priority-brief-workflow: package validation passed"
