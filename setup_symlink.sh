#!/bin/bash
set -eu

dot="${HOME}/dotfiles"
dot_config="${HOME}/dotfiles/_config"
config="${HOME}/.config"

# dotfiles ---------------------------------------

cd $dot
for file in .??*; do
  [[ -e $file ]] && continue
  [[ $file == ".gitignore" ]] && continue
  [[ $file == ".DS_Store" ]] && continue

  ln -snfv ${dot}/${file} ${HOME}/${file}
done

# .config (dirs) ---------------------------------

dir_alacritty="${config}/alacritty"
dir_bat="${config}/bat"
dir_fish="${config}/fish"
dir_git="${config}/git"
dir_kitty="${config}/kitty"
dir_nvim="${config}/nvim"
dir_ranger="${config}/ranger"
dir_zk="${config}/zk"

directories=($dir_alacritty $dir_bat $dir_fish \
  $dir_git $dir_kitty $dir_nvim $dir_ranger $dir_zk)

for d in ${directories[@]}; do
  [[ -e $d ]] && continue
  mkdir $d
done

# .config (files) --------------------------------

conf_alacritty="alacritty/alacritty.toml"
conf_bat="bat/config"
conf_fish="fish/config.fish"
conf_git="git/ignore"
conf_kitty="kitty/kitty.conf"
conf_ranger_rc="ranger/rc.conf"
conf_ranger_rifle="ranger/rifle.conf"
conf_zk="zk/config.toml"

confs=($conf_alacritty $conf_bat $conf_fish $conf_git \
  $conf_kitty $conf_ranger_rc $conf_ranger_rifle $conf_zk)

for conf in ${confs[@]}; do
  ln -snfv ${dot_config}/${conf} ${config}/${conf}
done

ln -snfv ${dot}/.vimrc ${dir_nvim}/init.vim
ln -snfv ${dot}/vim/config/ ${dir_nvim}/config

# .vim -------------------------------------------

if [[ ! -e ${HOME}/.vim/colors ]]; then
  mkdir -p ${HOME}/.vim/colors
fi

ln -snfv ${dot}/vim/config/ ${HOME}/.vim/config
