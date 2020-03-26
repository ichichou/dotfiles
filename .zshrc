## Basics
autoload -Uz compinit && compinit
autoload -Uz colors && colors

export LANG=ja_JP.UTF-8
bindkey -e

setopt print_eight_bit
setopt IGNOREEOF

PROMPT="
%~
%% "

## cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

## Completion
setopt auto_menu
setopt complete_in_word
setopt auto_param_slash
setopt auto_param_keys
# setopt list_types
# setopt correct

zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

# export LS_COLORS=""
# zstyle ":completion:*" list-colors ${LS_COLORS}

## History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

setopt hist_verify
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_no_store

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
