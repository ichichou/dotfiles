### Aliases

alias rm 'rmtrash'

alias mv 'mv -i'
alias cp 'cp -i'


### Functions

function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
end


### Greeting Message

set fish_greeting

