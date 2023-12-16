#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Yesterday's Journal
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

yesterday=`date -v -1d +%Y-%m-%d`
file="${yesterday}.bike"

if [ -e "${file}" ]; then
    open -a "bike" "${file}"
else
    echo "Not found yesterday's journal."
fi
