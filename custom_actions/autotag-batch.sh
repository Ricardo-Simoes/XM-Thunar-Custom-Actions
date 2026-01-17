#!/bin/bash
set -eu

# Script to run autotag on multiple files and show output in a terminal

# Find autotag binary in PATH, fail if not found
AUTOTAG_BIN="$(command -v autotag || true)"
if [ -z "$AUTOTAG_BIN" ]; then
  echo "ERROR: 'autotag' not found in PATH."
  echo "Please install it or adjust the PATH accordingly."
  exit 1
fi

echo "=== Autotag - TV Series Renaming ==="
echo

for f in "$@"; do
  echo "Processing: $f"
  "$AUTOTAG_BIN" -v -t --tv-pattern '%1 - S%2:00E%3:00 - %4' --windows-safe "$f"
  echo
done

echo "=== Finished ==="

