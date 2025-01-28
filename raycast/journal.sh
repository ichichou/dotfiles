#!/bin/bash
set -eu

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Journal
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

today=$(date +%Y-%m-%d)
file=${today}.bike

if [ ! -e "$file" ]; then
  touch "$file"
fi
open -a "bike" "$file"
