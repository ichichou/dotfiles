#!/bin/bash

set -eu

DOT_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# dotfiles を復元する手段

cd $DOT_DIR
for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv $DOT_DIR/$f $HOME/$f
done

mkdir -p $CONFIG_DIR
ln -snfv $DOT_DIR/config.fish $CONFIG_DIR/fish/config.fish
ln -snfv $DOT_DIR/karabiner.json $CONFIG_DIR/karabiner/karabiner.json

