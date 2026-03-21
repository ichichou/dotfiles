#!/bin/bash
set -eu

source_file="${HOME}/dotfiles/macskk/kana-rule_ichichou.conf"
target_file="${HOME}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Settings/kana-rule_ichichou.conf"

if [[ ! -e "$source_file" ]]; then
  echo "ERROR: kana-rule_ichichou.conf does not exists."
  exit 1
fi

cp -f "$source_file" "$target_file"
