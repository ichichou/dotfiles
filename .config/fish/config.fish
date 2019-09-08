## Aliases
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

### ls/exa
if test -e "/usr/local/bin/exa"
  alias ls 'exa -a'
  alias ll 'exa -1a'
  alias la 'exa -al --git'
else
  alias ls 'ls -aG'
  alias ll 'ls -1aG'
  alias la 'ls -alG'
end

## Settings
### Fish
set fish_greeting

### Fzf
set -U FZF_LEGACY_KEYBINDINGS 0

## Functions

