#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Draft
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

datetime=`date +"%Y%m%d%H%M%S"`
draft_dir="${HOME}/Dropbox/Draft"
file="${datetime}.bike"
path="${draft_dir}/${file}"

touch ${path} && open -a "bike" ${path}
