#!/bin/bash

# needs libwebp-utils

for file in "$@"; do
  base_name=$(basename "$file" .png)
  cwebp -q 80 "$file" -o "${base_name}.webp"
done
