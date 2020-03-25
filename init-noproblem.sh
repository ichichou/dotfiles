#!/bin/bash

set -eu

DOT="${HOME}/dotfiles"
CONFIG="${HOME}/.config"
VIM="${HOME}/.vim"
APP="${HOME}/Library/Application Support"

# dotfiles

if [[ ! -e ${DOT} ]]; then
    git clone https://github.com/ichichou/dotfiles.git ${HOME}
fi

cd ${DOT}
for i in .??*; do
    [[ ${i} == ".git" ]] && continue
    [[ ${i} == ".config" ]] && continue
    [[ ${i} == ".vim" ]] && continue
    [[ ${i} == ".gitignore" ]] && continue
    [[ ${i} == ".DS_Store" ]] && continue
    ln -snfv ${DOT}/${i} ${HOME}/${i}
done

# .config

mkdir -p ${CONFIG}/fish
ln -snfv ${DOT}/.config/fish/config.fish ${CONFIG}/fish/config.fish
ln -snfv ${DOT}/.config/fish/fishfile ${CONFIG}/fish/fishfile

mkdir -p ${CONFIG}/git
ln -snfv ${DOT}/.config/git/ignore ${CONFIG}/git/ignore

mkdir -p ${CONFIG}/karabiner
ln -snfv ${DOT}/.config/karabiner/karabiner.json ${CONFIG}/karabiner/karabiner.json

# .vim

mkdir -p ${VIM}/colors
ln -snfv ${DOT}/.vim/config/ ${VIM}/config

# if [[ ! -e ${VIM}/pack/minpac/opt/minpac/plugin/minpac.vim ]]; then
#     git clone https://github.com/k-takata/minpac.git \
#     ${VIM}/pack/minpac/opt/minpac
# if
