#!/bin/bash
set -eu

if [[ ! -e "/opt/homebrew/bin/yq" ]]; then
  echo "ERROR: yq command does not exist."
  exit 1
fi

source_dir="${HOME}/dotfiles/karabiner"
target_dir="${HOME}/.config/karabiner/assets/complex_modifications"

mkdir -p "$target_dir"

find "$source_dir" -name "*.yml" | while read -r f; do
  yaml=$(basename "$f")
  json="${yaml/yml/json}"
  yq eval -o=json "$f" > "$target_dir"/"$json"
done
