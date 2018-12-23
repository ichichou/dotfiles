#!/usr/local/bin/fish

set -eu

# git clone https://github.com/b4b4r07/enhancd
# source /path/to/enhancd/init.sh

gem update --system
gem install asciidoctor
gem install asciidoctor-diagram
gem install asciidoctor-pdf --pre
gem install asciidoctor-pdf-cjk

npm update -g npm
npm install -g gitbook
npm install -g gitbook-cli
npm install -g mermaid
npm install -g mermaid.cli

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add jethrokuan/fzf
fisher add jethrokuan/z
fisher add rafaelrinaldi/pure
# fisher add matchai/spacefish

