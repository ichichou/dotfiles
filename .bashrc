# Aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rmtrash'

alias ls='ls -aG'
alias la='ls -alG'
alias ll='ls -1aG'

alias b='brew'
alias bc='brew cask'
alias g='git'
alias v='vim'

# Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

