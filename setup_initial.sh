#!/bin/bash

set -eu

DOT="${HOME}/dotfiles"
CONFIG="${HOME}/.config"
SETTING="${HOME}/Box/Setting_files"
AQUA="${HOME}/Library/Application Support/AquaSKK"

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

mkdir -p ${CONFIG}/git
ln -snfv ${DOT}/ignore ${CONFIG}/git/ignore

mkdir -p "${AQUA}"
ln -snfv ${DOT}/kana-rule.conf "${AQUA}/kana-rule.conf"
ln -snfv ${DOT}/keymap.conf "${AQUA}/keymap.conf"

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

rm ${HOME}/Applications/.localized
rm ${HOME}/Desktop/.localized
rm ${HOME}/Documents/.localized
rm ${HOME}/Downloads/.localized
rm ${HOME}/Library/.localized
rm ${HOME}/Movies/.localized
rm ${HOME}/Music/.localized
rm ${HOME}/Pictures/.localized
rm ${HOME}/Public/.localized

