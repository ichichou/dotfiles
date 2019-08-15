# Aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rmtrash'

alias b='brew'
alias bc='brew cask'
alias g='git'
alias v='vim'
alias vi='vim'

# ls/exa
if [ -e /usr/local/bin/exa ]; then
    alias ls='exa -a'
    alias ll='exa -1a'
    alias la='exa -al --git'
else
    alias ls='ls -aG'
    alias ll='ls -1aG'
    alias la='ls -alG'
fi

# Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

