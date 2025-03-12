#!/bin/bash
set -eu

# skk-jisyo.utf8 ---------------------------------

source_jisyo="${HOME}/Library/CloudStorage/Box-Box/Config/macSKK/skk-jisyo.utf8"
target_jisyo="${HOME}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8"

if [[ -e "$source_jisyo" ]]; then
  cp -f "$source_jisyo" "$target_jisyo"
else
  echo "skk-jisyo.utf8 does not exists."
fi

# kana-rule.conf ---------------------------------

source_kana="${HOME}/dotfiles/macskk/kana-rule.conf"
target_kana="${HOME}/Library/Input Methods/macSKK.app/Contents/Resources/kana-rule.conf"

if [[ -e "$source_kana" ]]; then
  cp -f "$source_kana" "$target_kana"
else
  echo "kana-rule.conf does not exists."
fi
