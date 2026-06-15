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

if [ ! -e "$file" ]; then
  echo "$initial_content" > "$file"
fi

open -a "bike" "$file"
