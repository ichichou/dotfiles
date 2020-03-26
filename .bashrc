## Aliases
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

if [ -e /usr/local/bin/exa ]; then
    alias ls="exa -A"
    alias ll="exa -1A"
    alias la="exa -Al --git"
else
    alias ls="ls -AG"
    alias ll="ls -1AG"
    alias la="ls -AlG"
fi

alias b="brew"
alias bc="brew cask"
alias g="git"
alias mvi="mvim --remote-silent"
alias vi="vim"

## Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
