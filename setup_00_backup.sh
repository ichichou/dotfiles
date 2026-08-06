#!/bin/bash
set -eu

backup_dir="${HOME}/Library/CloudStorage/Box-Box/Backup"

# macSKK ユーザー辞書をバックアップ
cp ~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8 "$backup_dir"/.

# Fish, Zsh の history をバックアップ
cp ~/.local/share/fish/fish_history "$backup_dir"/.
cp ~/.zsh_history                   "$backup_dir"/_zsh_history
