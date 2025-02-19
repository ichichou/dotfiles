#!/bin/bash
set -eu

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Yesterday's Journal
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

num=-1
past_day=$(date -v ${num}d +%Y-%m-%d)
temp_file=${past_day}.bike
file=""

while true; do
  if [ -e "$temp_file" ]; then
    file=$temp_file
    break
  else
    num=$(( num - 1 ))
    past_day=$(date -v ${num}d +%Y-%m-%d)
    temp_file=${past_day}.bike
  fi
done

open -a "bike" "$file"
