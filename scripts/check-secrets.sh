#!/bin/bash
# Scan git-tracked files for credential material.
#
# Usage: ./scripts/check-secrets.sh
# Exit status is non-zero if anything suspicious is found, so it can be used
# directly as a pre-commit hook:
#
#   ln -sf ../../scripts/check-secrets.sh .git/hooks/pre-commit

set -euo pipefail

SOURCE="${BASH_SOURCE[0]}"
while [[ -L "$SOURCE" ]]; do
  DIR="$(cd "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ "$SOURCE" != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd "$(dirname "$SOURCE")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_DIR"

# Key material only. Variable *names* such as deepseek_api_key are fine.
PATTERNS=(
  'sk-[A-Za-z0-9_-]{16,}'                      # OpenAI / DeepSeek style secret keys
  'gh[pousr]_[A-Za-z0-9]{20,}'                 # GitHub tokens
  '-----BEGIN [A-Z ]*PRIVATE KEY-----'
  'Bearer[[:space:]]+[A-Za-z0-9_.-]{20,}'      # inline bearer tokens
)

status=0

while IFS= read -r file; do
  [[ -f "$file" ]] || continue

  case "$(basename "$file")" in
    prefs.plist)
      echo "BLOCKED: $file (per-workflow config, may contain an API key)" >&2
      status=1
      continue
      ;;
  esac

  for pattern in "${PATTERNS[@]}"; do
    if matches="$(grep -nEI -e "$pattern" "$file")"; then
      echo "POTENTIAL SECRET in $file:" >&2
      echo "$matches" >&2
      status=1
    fi
  done
done < <(git ls-files)

if [[ $status -eq 0 ]]; then
  echo "OK: no credential material in tracked files ($(git ls-files | wc -l | tr -d ' ') files scanned)."
else
  echo "FAILED: remove the material above before committing." >&2
fi

exit $status
