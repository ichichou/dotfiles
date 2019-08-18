#!/usr/local/bin/fish

set -eu

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher self-update
fisher add 0rax/fish-bd
fisher add jethrokuan/fzf
fisher add jethrokuan/z
fisher add rafaelrinaldi/pure

# gem update --system
# gem install asciidoctor
# gem install asciidoctor-pdf --pre
# gem install asciidoctor-pdf-cjk
# gem install asciidoctor-diagram

