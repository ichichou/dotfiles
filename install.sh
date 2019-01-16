#!/bin/bash

set -eu

DOT_DIR="${HOME}/dotfiles"
CONFIG_DIR="${HOME}/.config"

if [[ ! -e ${DOT_DIR} ]]; then
    mkdir -p ${DOT_DIR}
    cd ${HOME}
    git clone https://github.com/ichichou/dotfiles.git
fi

cd ${DOT_DIR}
for i in .??*; do
    [[ ${i} == ".git" ]] && continue
    [[ ${i} == ".gitignore" ]] && continue
    [[ ${i} == ".DS_Store" ]] && continue
    ln -snfv ${DOT_DIR}/${i} ${HOME}/${i}
done

mkdir -p ${CONFIG_DIR}/fish ${CONFIG_DIR}/karabiner
ln -snfv ${DOT_DIR}/config.fish ${CONFIG_DIR}/fish/config.fish
ln -snfv ${DOT_DIR}/karabiner.json ${CONFIG_DIR}/karabiner/karabiner.json

