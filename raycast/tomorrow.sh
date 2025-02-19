#!/bin/bash
set -eu

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Tomorrow's Journal
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

tomorrow=$(date -v +1d +%Y-%m-%d)
file=${tomorrow}.bike

if [ ! -e "$file" ]; then
  touch "$file"
fi

open -a "bike" "$file"
