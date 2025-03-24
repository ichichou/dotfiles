#!/bin/bash
set -eu

dotfiles="${HOME}/dotfiles"
macskk_dir="${HOME}/dotfiles/macskk"

# command/ ---------------------------------------

ln -snfv "$dotfiles"/command/ "$HOME"/command

# macSKK -----------------------------------------

cd "$macskk_dir"
./cp_dicts.sh
./cp_skk-jisyo.sh
./cp_kana-rule.sh
