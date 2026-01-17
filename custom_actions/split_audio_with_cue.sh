#!/bin/bash
# split-audio-with-cue.sh — splits MP3 or FLAC using FFcuesplitter (no reencode)

# Ensure a file argument was given
if [ -z "$1" ]; then
  echo "Usage: split_cue.sh <file.cue>"
  exit 1
fi

CUE_FILE="$1"

# Detect format from audio file referenced inside the CUE
AUDIO_FILE="$(grep -m1 -oP '(?<=FILE \").*?(?=\")' "$CUE_FILE")"

# If CUE doesn't contain a file reference, fallback to same folder
if [ -z "$AUDIO_FILE" ]; then
  echo "Could not detect audio file in CUE. Exiting."
  exit 1
fi

# Get extension in lowercase
ext="${AUDIO_FILE##*.}"
fmt="${ext,,}"

echo "Detected format: $fmt"
echo "Splitting '$CUE_FILE' ..."
echo

# Run FFcuesplitter
ffcuesplitter -i "$CUE_FILE" -f "$fmt"

echo
echo "Done!"
read -p "Press Enter to close..."
