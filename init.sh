#!/bin/bash
set -eu

DOT="${HOME}/dotfiles"
CONFIG="${HOME}/.config"
VIM="${HOME}/.vim"
APP="${HOME}/Library/Application Support"

## dotfiles
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

## .config
mkdir -p ${CONFIG}/fish
ln -snfv ${DOT}/.config/fish/config.fish ${CONFIG}/fish/config.fish

mkdir -p ${CONFIG}/git
ln -snfv ${DOT}/.config/git/ignore ${CONFIG}/git/ignore

mkdir -p ${CONFIG}/karabiner
ln -snfv ${DOT}/karabiner/complex_modifications/ ${CONFIG}/karabiner/assets/complex_modifications
# Karabiner の箇所は2回以上実行するとディレクトリが入れ子になってしまうかも

## .vim
mkdir -p ${VIM}/colors
ln -snfv ${DOT}/.vim/config/ ${VIM}/config

## Application Support
sudo sh -c "mkdir -p \"${APP}/Code/User\""
sudo sh -c "ln -snfv ${DOT}/vscode/setting.json \"${APP}/Code/User/setting.json\""

## .localized
sudo sh -c "rm -v ${HOME}/Desktop/.localized"
sudo sh -c "rm -v ${HOME}/Documents/.localized"
sudo sh -c "rm -v ${HOME}/Downloads/.localized"
sudo sh -c "rm -v ${HOME}/Library/.localized"
sudo sh -c "rm -v ${HOME}/Movies/.localized"
sudo sh -c "rm -v ${HOME}/Music/.localized"
sudo sh -c "rm -v ${HOME}/Pictures/.localized"
sudo sh -c "rm -v ${HOME}/Public/.localized"
sudo sh -c "rm -v ${HOME}/Applications/.localized"
