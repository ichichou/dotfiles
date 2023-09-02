# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
## Aliases
alias cp="cp -iv"
alias mv="mv -iv"

if [ -e /opt/homebrew/bin/exa -o -e /usr/local/bin/exa ]; then
    alias ls="exa -a"
    alias ll="exa -1a"
    alias la="exa -al --git"
else
    alias ls="ls -AG"
    alias ll="ls -1AG"
    alias la="ls -AlG"
fi

if [ -e /opt/homebrew/bin/trash -o -e /usr/local/bin/trash ]; then
    alias rm="trash"
else
    alias rm="rm -iv"
fi

alias b="brew"
alias g="git"
alias mvi="mvim"
alias vi="vim"

## Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
