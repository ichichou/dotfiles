#!/bin/bash
set -eu

source_file="${HOME}/dotfiles/macskk/kana-rule.conf"
target_file="${HOME}/Library/Input Methods/macSKK.app/Contents/Resources/kana-rule.conf"

if [[ ! -e "$source_file" ]]; then
  echo "ERROR: kana-rule.conf does not exists."
  exit 1
fi

cp -f "$source_file" "$target_file"
