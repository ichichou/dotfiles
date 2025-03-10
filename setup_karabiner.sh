#!/bin/bash
set -eu

if [[ ! -e "/opt/homebrew/bin/yq" ]]; then
  exit 0
fi

conf_kb="${HOME}/.config/karabier/assets/complex_modifications"
dot_kb="${HOME}/dotfiles/karabiner"

cd "$dot_kb"
for file in *.yml; do
  yq eval -o=json "$dot_kb"/"$file" > "$conf_kb"/"$file"
done
