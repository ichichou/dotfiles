#!/bin/bash

set -eu

REPOS_DIR="${HOME}/repos"
CONFIG_DIR="${HOME}/.config"

if [[ ! -e ${REPOS_DIR} ]]; then
    mkdir -p ${REPOS_DIR}
    cd ${REPOS_DIR}
    # git clone https://github.com/ichichou/drafts.git ${REPOS_DIR}/drafts
    git clone https://github.com/chriskempson/base16-shell.git ${CONFIG_DIR}/base16-shell
fi

