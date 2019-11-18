## aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias reload 'exec fish'
alias symln 'ln -snfv'

if test -e "/usr/local/bin/rmtrash"
  alias rm 'rmtrash'
else
  alias rm 'rm -iv'
end

alias b 'brew'
alias bc 'brew cask'
alias g 'git'
alias gu 'gitup'
alias j 'z'
alias mozj 'mozcjpeg -optimize'
alias mvi 'mvim'
alias notif 'terminal-notifier -message "🤘Done!" -sound glass'
alias t 'tmux'
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

function mozjall
  mkdir -p mozjpeg
  for i in *.jpg
    mozcjpeg -optimize $i > mozjpeg/$i
  end
end

## fish
set fish_greeting

## fzf
set -U FZF_LEGACY_KEYBINDINGS 0
