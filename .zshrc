# vim: foldlevel=99

# -- Fish Shell {{{

if [[ -o login ]]; then
  exec fish
fi

# }}}

# -- General {{{

export LANG=ja_JP.UTF-8
export KCODE=u
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"

autoload -Uz colors && colors
autoload -Uz promptinit && promptinit
autoload -Uz compinit && compinit

bindkey -e

setopt print_eight_bit
setopt IGNOREEOF

if [ -e /opt/homebrew/bin/vivid ]; then
  export LS_COLORS="$(vivid generate catppuccin-macchiato)"
fi

# }}}

# -- Navigation {{{

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# }}}

# -- Completion {{{

setopt auto_menu
setopt complete_in_word
setopt auto_param_slash
setopt auto_param_keys

zstyle ":completion:*:commands" rehash 1
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*" list-colors ${LS_COLORS}
zstyle ":completion:*" menu select

# }}}

# -- History {{{

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

# }}}

# -- Functions {{{

# Auto ls ----------------------------------------

function chpwd() {
  if [[ $(ls -Al1 $(pwd) | wc -l) -gt 50 ]]; then
    echo "(>50 items exist in $(basename $(pwd))/)"
  else
    if [[ -e /opt/homebrew/bin/eza ]]; then
      eza -a
    else
      ls -AG
    fi
  fi
}

# }}}

# -- Apps {{{

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# >>> juliaup initialize >>>

path=('/Users/kazu/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# }}}

# -- Plugins {{{

# Plugin list: ~/.config/sheldon/plugins.toml
# To edit: >_ sheldon edit

eval "$(sheldon source)"

# Pure -------------------------------------------

export PURE_PROMPT_SYMBOL="zsh ▶"
export PURE_PROMPT_VICMD_SYMBOL="zsh ◀"

# zsh-abbr ---------------------------------------

# General
abbr -S --quieter e="exit"
abbr -S --quieter lns="ln -snfv"
abbr -S --quieter rmds="rm .DS_Store"
abbr -S --quieter ud="cd .."
abbr -S --quieter --force cp="cp -iv"
abbr -S --quieter --force mv="mv -iv"

# Apps
abbr -S --quieter a="bat"
abbr -S --quieter b="brew"
abbr -S --quieter g="git"
abbr -S --quieter j="z"
abbr -S --quieter n="numbat"
abbr -S --quieter nvi="nvim"
abbr -S --quieter r="ranger"
abbr -S --quieter ra="radian"
abbr -S --quieter t="tig"
abbr -S --quieter ts="tig status"
abbr -S --quieter --force vi="vim"

# eza/ls
if [ -e /opt/homebrew/bin/eza ]; then
  abbr -S --quieter la="eza -al --git"
  abbr -S --quieter ll="eza -1a"
  abbr -S --quieter --force ls="eza -a"
else
  abbr -S --quieter la="ls -AlG"
  abbr -S --quieter ll="ls -1AG"
  abbr -S --quieter --force ls="ls -AG"
fi

# trash/rm
if [ -e /opt/homebrew/bin/trash ]; then
  abbr -S --quieter --force rm="trash"
else
  abbr -S --quieter --force rm="rm -iv"
fi

# zsh-autosuggestions-abbreviations-strategy -----

export ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )

# }}}
