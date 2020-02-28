#!/usr/local/bin/fish

set -eu

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher self-update
fisehr

set -U fish_user_paths /usr/local/opt/ruby/bin $fish_user_paths

npm -g install npm
npm -g install eslint
npm -g install eslint-plugin-prettier
npm -g install htmlhint
npm -g install prettier

gem update --system
gem install asciidoctor
gem install asciidoctor-pdf
gem install asciidoctor-pdf-cjk
gem install asciidoctor-diagram
