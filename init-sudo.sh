#!/bin/bash

set -eu

DOT="${HOME}/dotfiles"
CONFIG="${HOME}/.config"
VIM="${HOME}/.vim"
APP="${HOME}/Library/Application Support"

# Application Support

sudo sh -c "mkdir -p \"${APP}/AquaSKK\""
sudo sh -c "ln -snfv ${DOT}/aquaskk/kana-rule.conf \"${APP}/AquaSKK/kana-rule.conf\""
sudo sh -c "ln -snfv ${DOT}/aquaskk/keymap.conf \"${APP}/AquaSKK/keymap.conf\""

sudo sh -c "mkdir -p \"${APP}/Code/User\""
sudo sh -c "ln -snfv ${DOT}/vscode/setting.json \"${APP}/Code/User/setting.json\""

# Key Repeat

sudo sh -c "defaults write -g InitialKeyRepeat -int 10"
sudo sh -c "defaults write -g KeyRepeat -int 1"

# .localized

sudo sh -c "rm -v ${HOME}/Applications/.localized"
sudo sh -c "rm -v ${HOME}/Desktop/.localized"
sudo sh -c "rm -v ${HOME}/Documents/.localized"
sudo sh -c "rm -v ${HOME}/Downloads/.localized"
sudo sh -c "rm -v ${HOME}/Library/.localized"
sudo sh -c "rm -v ${HOME}/Movies/.localized"
sudo sh -c "rm -v ${HOME}/Music/.localized"
sudo sh -c "rm -v ${HOME}/Pictures/.localized"
sudo sh -c "rm -v ${HOME}/Public/.localized"
