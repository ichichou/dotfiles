#!/bin/bash
set -eu

dotfiles="${HOME}/dotfiles"
macskk_dir="${HOME}/dotfiles/macskk"

# command/ ---------------------------------------

ln -snfv "$dotfiles"/command/ "$HOME"/command

# macSKK -----------------------------------------

cd "$macskk_dir"
./cp_dicts.sh    # Copy dictionary files
./cp_configs.sh  # Copy 'skk-jisyo.utf8' and 'kana-rule.conf'
