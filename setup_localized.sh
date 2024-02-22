#!/bin/bash
set -eu

sudo sh -c "rm -v ${HOME}/Applications/.localized"
sudo sh -c "rm -v ${HOME}/Desktop/.localized"
sudo sh -c "rm -v ${HOME}/Documents/.localized"
sudo sh -c "rm -v ${HOME}/Downloads/.localized"
sudo sh -c "rm -v ${HOME}/Library/.localized"
sudo sh -c "rm -v ${HOME}/Movies/.localized"
sudo sh -c "rm -v ${HOME}/Music/.localized"
sudo sh -c "rm -v ${HOME}/Pictures/.localized"
sudo sh -c "rm -v ${HOME}/Public/.localized"
