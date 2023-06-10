#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Draft
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Dropbox/Draft

# Optional parameters:
# @raycast.icon 🤖

datetime=`date +"%Y%m%d%H%M%S"`
file="${datetime}.bike"

touch ${file} && open -a "bike" ${file}
