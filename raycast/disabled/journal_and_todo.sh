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

# Todo File
todo_file=$(realpath ../Task/todo.bike)

# Open Files
open -a "bike" "$todo_file" "$today_file"
open -a "bike" "$todo_file"
