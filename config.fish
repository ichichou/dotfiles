# Aliases

alias rm 'rmtrash'

alias mv 'mv -i'
alias cp 'cp -i'

alias la 'ls -aG'
alias ll 'ls -lG'
alias lla 'ls -alG'


# Functions

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end


# Greeting Message

set fish_greeting
