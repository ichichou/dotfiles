#!/bin/bash
set -eu

mkdir -p "$HOME"/repos
repos="${HOME}/repos"
dotfiles="${HOME}/dotfiles"
macskk_dir="${HOME}/dotfiles/macskk"

# command/ ---------------------------------------

ln -snfv "$dotfiles"/command/ "$HOME"/command

# macSKK -----------------------------------------

if [[ ! -e "/opt/homebrew/bin/gh" ]]; then
  echo "ERROR: gh command does not exists."
  exit 1
fi

cd "$repos"
gh repo clone skk-dev/dict

cd "$macskk_dir"
./cp_dicts.sh    # Copy dictionary files
./cp_configs.sh  # Copy 'skk-jisyo.utf8' and 'kana-rule.conf'
