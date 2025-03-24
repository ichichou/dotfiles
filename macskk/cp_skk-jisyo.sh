#!/bin/bash
set -eu

source_file="${HOME}/Library/CloudStorage/Box-Box/Config/macSKK/skk-jisyo.utf8"
target_file="${HOME}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8"

if [[ ! -e "$source_file" ]]; then
  echo "ERROR: skk-jisyo.utf8 does not exists."
  exit 1
fi

cp -f "$source_file" "$target_file"
