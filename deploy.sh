#!/bin/bash

set -u

DOT_DIR="${HOME}/dotfiles"
CONFIG_DIR="${HOME}/.config"

for f in .??*
do
    [ "$f" == ".git" ] && continue
    [ "$f" == ".gitignore" ] && continue
    [ "$f" == ".DS_Store" ] && continue

    ln -snfv ${DOT_DIR}/${f} ${HOME}/${f}
done

ln -snfv ${DOT_DIR}/config.fish ${CONFIG_DIR}/fish/config.fish
ln -snfv ${DOT_DIR}/karabiner.json ${CONFIG_DIR}/karabiner/karabiner.json

