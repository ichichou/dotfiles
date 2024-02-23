#!/bin/bash
set -eu

file=".localized"

# Home -------------------------------------------

sudo sh -c "rm -fv ${HOME}/Applications/${file}"
sudo sh -c "rm -fv ${HOME}/Desktop/${file}"
sudo sh -c "rm -fv ${HOME}/Documents/${file}"
sudo sh -c "rm -fv ${HOME}/Downloads/${file}"
sudo sh -c "rm -fv ${HOME}/Library/${file}"
sudo sh -c "rm -fv ${HOME}/Movies/${file}"
sudo sh -c "rm -fv ${HOME}/Music/${file}"
sudo sh -c "rm -fv ${HOME}/Pictures/${file}"
sudo sh -c "rm -fv ${HOME}/Public/${file}"

# Root -------------------------------------------

sudo sh -c "rm -fv /Applications/${file}"
sudo sh -c "rm -fv /Library/${file}"
sudo sh -c "rm -fv /Users/${file}"

# Does not work?
sudo sh -c "rm -fv /System/${file}"
