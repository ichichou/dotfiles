#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Journal
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

today=`date +"%Y-%m-%d"`
journal_file="${today}.bike"
journal_dir="${HOME}/Dropbox/Journal/"
journal_path="${journal_dir}${journal_file}"

if [ -e "${journal_path}" ]; then
    open -a "bike" "${journal_path}"
else
    touch "${journal_path}" && open -a "bike" "${journal_path}"
fi
