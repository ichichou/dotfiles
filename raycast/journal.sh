#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Journal
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Dropbox/Journal

# Optional parameters:
# @raycast.icon 🤖

today=`date +"%Y-%m-%d"`
file="${today}.bike"

if [ -e "${file}" ]; then
    open -a "bike" "${file}"
else
    touch "${file}" && open -a "bike" "${file}"
fi
