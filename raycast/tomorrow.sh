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
