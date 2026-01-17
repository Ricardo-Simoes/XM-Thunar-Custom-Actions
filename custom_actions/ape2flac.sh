#!/bin/bash
# Convert APE files to FLAC (lossless)
# Usage: ape2flac.sh file1.ape file2.ape ...

if [ $# -eq 0 ]; then
    echo "No .ape files provided."
    exit 1
fi

for f in "$@"; do
    if [[ "$f" == *.ape ]]; then
        out="${f%.ape}.flac"
        echo "Converting: $f → $out"
        ffmpeg -i "$f" -c:a flac "$out"
    else
        echo "Skipping non-APE file: $f"
    fi
done

echo "All conversions finished."

