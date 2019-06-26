#!/bin/bash

set -eu

DOT="${HOME}/dotfiles"
CONFIG="${HOME}/.config"
SETTING="${HOME}/Box/Setting_files"
# AQUA="${HOME}/Library/Application\ Support/AquaSKK"

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

mkdir -p ${CONFIG}/karabiner
ln -snfv ${DOT}/karabiner.json ${CONFIG}/karabiner/karabiner.json

mkdir -p ${CONFIG}/fish
ln -snfv ${DOT}/config.fish ${CONFIG}/fish/config.fish

# mkdir -p ${AQUA}
ln -snfv ${DOT}/kana-rule.conf ${HOME}/Library/Application\ Support/AquaSKK/kana-rule.conf
ln -snfv ${DOT}/keymap.conf ${HOME}/Library/Application\ Support/AquaSKK/keymap.conf
ln -snfv ${SETTING}/AquaSKK/skk-jisyo.utf8 ${HOME}/Library/Application\ Support/AquaSKK/skk-jisyo.utf8

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

rm ${HOME}/Applications/.localized ${HOME}/Desktop/.localized ${HOME}/Documents/.localized ${HOME}/Downloads/.localized ${HOME}/Library/.localized ${HOME}/Movies/.localized ${HOME}/Music/.localized ${HOME}/Pictures/.localized ${HOME}/Public/.localized

