#!/bin/bash
set -eu

dotfiles="${HOME}/dotfiles"
dot_config="${HOME}/dotfiles/_config"
home_config="${HOME}/.config"

if [[ ! -d "$dot_config" ]]; then
  echo "ERROR: $dot_config does not exist."
  exit 1
fi

if [[ ! -d "$home_config" ]]; then
  echo "ERROR: $home_config does not exist."
  exit 1
fi

cd "$dotfiles"

# dotfiles 直下のファイルのシンボリックリンクを HOME 直下に貼る

find "$dotfiles" -type f -name ".??*" -depth 1 | while read -r f; do
  [[ $(basename "$f") == ".DS_Store"  ]] && continue
  [[ $(basename "$f") == ".gitignore" ]] && continue
  ln -snfv "$f" "${f/$dot_config/$home_config}"
done

# ~/.config 下にディレクトリを作成（上書きしない）

find "$dot_config" -type d | while read -r d; do
  mkdir -p "${d/$dot_config/$home_config}"
done

# ~/.config 下の各ディレクトリ内にシンボリックリンクを貼る
# ファイルまたはシンボリックリンクが存在していても上書き

find "$dot_config" -type f | while read -r f; do
  [[ $(basename "$f") == ".DS_Store" ]] && continue
  [[ $(basename "$f") == "init.vim"  ]] && continue
  ln -snfv "$f" "${f/$dot_config/$home_config}"
done

# Neovim は元ファイルとシンボリックリンクの名前が異なるので特別に処理

ln -snfv "$dotfiles"/.vimrc "$home_config"/nvim/init.vim

# Vim の設定ファイル用ディレクトリを作成
# config ディレクトリごとシンボリックリンクを貼る（Vim, Neovim）

mkdir -p "$HOME"/.vim/colors
ln -snfv "$dotfiles"/vim/config/ "$HOME"/.vim/config
ln -snfv "$dotfiles"/vim/config/ "$home_config"/nvim/config
