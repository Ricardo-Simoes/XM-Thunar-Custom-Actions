#!/usr/bin/env bash

# Exit if no files were provided
[ "$#" -eq 0 ] && exit 0

for input in "$@"; do
    # Skip if not a regular file
    [ ! -f "$input" ] && continue

    dir="$(dirname "$input")"
    filename="$(basename "$input")"
    name="${filename%.*}"
    output="${dir}/${name}.mp4"

    echo "=============================================="
    echo "Input : $input"
    echo "Output: $output"
    echo "----------------------------------------------"

    ffmpeg -hide_banner -loglevel info \
        -i "$input" \
        -map 0:v? -map 0:a? \
        -c:v libx264 -preset medium -crf 22 \
        -c:a aac -b:a 192k \
        -movflags +faststart \
        "$output"

    echo "Finished: $output"
    echo
done

echo "All tasks completed."
echo "Press ENTER to close this terminal."
read

