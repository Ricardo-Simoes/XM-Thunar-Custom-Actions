#!/bin/bash

# This script is meant to be called by Thunar custom action

# Change working directory to the location of the first selected file
cd "$(dirname "$1")" || exit 1

# Extract the directory name from the first selected file
directory_name=$(basename "$(pwd)")

# Replace spaces with underscores and append .m3u
playlist="${directory_name// /_}.m3u"

# Create an empty playlist
echo "#EXTM3U" > "$playlist"

# Loop through selected files
for file in "$@"
do
    # Append the basename to the playlist
    echo "$(basename "$file")" >> "$playlist"
done

