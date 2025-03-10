#!/bin/bash
set -eu

if [[ ! -e "/opt/homebrew/bin/yq" ]]; then
  exit 0
fi

dir_complex_modifications="${HOME}/.config/karabiner/assets/complex_modifications"

if [[ ! -d "$dir_complex_modifications" ]]; then
  mkdir -p "$dir_complex_modifications"
fi

cd "$HOME"/dotfiles/karabiner/
for file_yaml in *.yml; do
  file_json="${file_yaml/yml/json}"
  yq eval -o=json "$file_yaml" > "$dir_complex_modifications"/"$file_json"
done
