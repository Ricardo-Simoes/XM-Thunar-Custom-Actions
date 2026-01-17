#!/bin/bash
for file in "$@"; do
  find "$file" -depth -name "* *" -execdir bash -c 'mv -- "$0" "${0// /_}"' {} \;
done
