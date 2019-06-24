#!/bin/bash

set -eu

DOT="${HOME}/dotfiles"
CONFIG="${HOME}/.config"

if [[ ! -e ${DOT} ]]; then
    mkdir -p ${DOT}
    cd ${HOME}
    git clone https://github.com/ichichou/dotfiles.git
fi

cd ${DOT}
for i in .??*; do
    [[ ${i} == ".git" ]] && continue
    [[ ${i} == ".gitignore" ]] && continue
    [[ ${i} == ".DS_Store" ]] && continue
    ln -snfv ${DOT}/${i} ${HOME}/${i}
done

mkdir -p ${CONFIG}/karabiner ${CONFIG}/fish
ln -snfv ${DOT}/karabiner.json ${CONFIG}/karabiner/karabiner.json
ln -snfv ${DOT}/config.fish ${CONFIG}/fish/config.fish

