#!/usr/local/bin/fish
set -eu

if test ! -f ~/.config/fish/functions/fisher.fish
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

fisher self-update
fisehr

gem update --system
gem install asciidoctor
gem install asciidoctor-pdf
gem install asciidoctor-pdf-cjk
gem install asciidoctor-diagram
gem install rouge

npm -g install npm
npm -g install eslint
npm -g install prettier
npm -g install eslint-plugin-prettier
npm -g install htmlhint
