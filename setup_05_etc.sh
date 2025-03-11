#!/bin/bash
set -eu

mkdir -p "$HOME"/repos
repos="${HOME}/repos"
dotfiles="${HOME}/dotfiles"
macskk_dir="${HOME}/dotfiles/macskk"

# command/ ---------------------------------------

ln -snfv "$dotfiles"/command/ "$HOME"/command

# macSKK -----------------------------------------

cd "$repos"
gh repo clone skk-dev/dict

cd "$macskk_dir"
./cp_dicts.sh    # dict
./cp_configs.sh  # skk-jisyo.utf8, kana-rule.conf
