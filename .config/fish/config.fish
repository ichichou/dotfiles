## aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm 'rmtrash'

alias b 'brew'
alias bc 'brew cask'
alias g 'git'
alias gu 'gitup'
alias j 'z'
alias mvi 'mvim'
alias noti 'terminal-notifier -message "🤘Done!" -sound glass'
alias vi 'vim'

if test -e "/usr/local/bin/exa"
  alias ls 'exa -a'
  alias ll 'exa -1a'
  alias la 'exa -al --git'
else
  alias ls 'ls -aG'
  alias ll 'ls -1aG'
  alias la 'ls -alG'
end

## functions

functions --copy cd standard_cd

function cd
  standard_cd $argv; and la
end

## fish
set fish_greeting

## fzf
set -U FZF_LEGACY_KEYBINDINGS 0

