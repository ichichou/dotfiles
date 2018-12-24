#!/bin/bash

set -eu

REPOS_DIR="${HOME}/repos"

if [[ ! -e ${REPOS_DIR} ]]; then
    mkdir -p ${REPOS_DIR}
    cd ${REPOS_DIR}
    # git clone https://github.com/ichichou/
fi

