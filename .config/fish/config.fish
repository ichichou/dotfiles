## aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias reload 'exec fish'
alias symln 'ln -snfv'

alias b 'brew'
alias bc 'brew cask'
alias g 'git'
alias gu 'gitup'
alias j 'z'
alias jl 'jupyter lab'
alias mvi 'mvim'
alias t 'tmux'
alias vi 'vim'

if test -e '/usr/local/bin/rmtrash'
    alias rm 'rmtrash'
else
    alias rm 'rm -iv'
end

if test -e '/usr/local/bin/exa'
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
    standard_cd $argv; and ls
end

## fish
set fish_greeting

## fzf
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

## ruby
set -x fish_user_paths /usr/local/opt/ruby/bin $fish_user_paths
