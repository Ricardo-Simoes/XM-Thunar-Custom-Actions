#!/bin/bash
for file in "$@"; do
  base_name=$(basename "$file" .jpg)
  cwebp -q 90 "$file" -o "${base_name}.webp"
done
