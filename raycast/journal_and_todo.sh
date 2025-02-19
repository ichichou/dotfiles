#!/bin/bash
set -eu

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Journal and Todo
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

# Create Today's Journal
today=$(date +%Y-%m-%d)
today_file=${today}.bike

if [ ! -e "$today_file" ]; then
  touch "$today_file"
fi

# Todo File
todo_file=$(realpath ../Task/todo.bike)

# Open Files
open -a "bike" "$todo_file" "$today_file"
open -a "bike" "$todo_file"
