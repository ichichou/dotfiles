#!/bin/bash
set -eu

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Morning Routine
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

# # Todo File
# todo_file=$(realpath ../Notes/todo.bike)

# Create Today's Journal
today=$(date +%Y-%m-%d)
today_file=${today}.bike

initial_content=$(cat << 'EOT'
<?xml version="1.0" encoding="UTF-8"?>
<html>
  <head>
    <meta charset="utf-8"/>
  </head>
  <body>
    <ul>
      <li>
        <p/>
      </li>
    </ul>
  </body>
</html>
EOT
)

if [ ! -e "$today_file" ]; then
  echo "$initial_content" > "$today_file"
fi

# Find Yesterday's Journal
num=-1
past_day=$(date -v ${num}d +%Y-%m-%d)
temp_past_file=${past_day}.bike
past_file=""

while true; do
  if [ -e "$temp_past_file" ]; then
    past_file=$temp_past_file
    break
  else
    num=$(( num - 1 ))
    past_day=$(date -v ${num}d +%Y-%m-%d)
    temp_past_file=${past_day}.bike
  fi
done

# Open Files
# open -a "bike" "$todo_file" "$today_file" "$past_file"
open -a "bike" "$today_file" "$past_file"
