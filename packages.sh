#!/usr/local/bin/fish

set -eu

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher self-update
fisher add jethrokuan/fzf
fisher add jethrokuan/z
fisher add jorgebucaran/fish-spin
fisher add rafaelrinaldi/pure

gem update --system
gem install asciidoctor
gem install asciidoctor-diagram
gem install asciidoctor-pdf --pre
gem install asciidoctor-pdf-cjk

npm update -g npm
npm install -g gitbook-cli
npm install -g mermaid
npm install -g mermaid.cli

