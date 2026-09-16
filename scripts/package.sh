#!/bin/bash
# Build an importable .alfredworkflow from a workflow folder.
#
# Usage: ./scripts/package.sh <workflow-folder> [output-dir]
#
# The produced archive has info.plist at its root, which is what Alfred expects.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename "$0") <workflow-folder> [output-dir]" >&2
  echo "Available workflows:" >&2
  find "$REPO_DIR" -mindepth 1 -maxdepth 1 -type d \
    ! -name scripts ! -name dist ! -name '.git*' \
    -exec basename {} \; | sort | sed 's/^/  /' >&2
  exit 1
fi

NAME="$(basename "$1")"
SRC="$REPO_DIR/$NAME"
OUT_DIR="${2:-$REPO_DIR/dist}"
OUT="$OUT_DIR/$NAME.alfredworkflow"

if [[ ! -f "$SRC/info.plist" ]]; then
  echo "error: no info.plist in $SRC" >&2
  exit 1
fi

plutil -lint "$SRC/info.plist" >/dev/null

FILES=()
while IFS= read -r -d '' file; do
  FILES+=("${file#"$SRC"/}")
done < <(find "$SRC" -type f \
  ! -name 'README.md' ! -name 'LICENSE' ! -name '.DS_Store' ! -name '.gitignore' -print0)

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "error: nothing to package in $SRC" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"
rm -f "$OUT"
(cd "$SRC" && zip -q -X "$OUT" "${FILES[@]}")

echo "Built $OUT"
unzip -l "$OUT"
