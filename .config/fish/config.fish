## Aliases
alias cp "cp -iv"
alias mv "mv -iv"
alias reload "exec fish"
alias symln "ln -snfv"
alias pd "prevd"
alias nd "nextd"

if test -e "/usr/local/bin/trash"
    alias rm "trash"
else
    alias rm "rm -iv"
end

if test -e "/usr/local/bin/exa"
    alias ls "exa -a"
    alias ll "exa -1a"
    alias la "exa -al --git"
else
    alias ls "ls -AG"
    alias ll "ls -1AG"
    alias la "ls -AlG"
end

alias b "brew"
alias g "git"
alias gu "gitup"
alias j "z"
alias jl "jupyter lab"
alias mvi "mvim --remote-silent"
alias vi "vim"

## Keybinds
bind -e \cl
bind -e \cj
bind -e \cf

## Functions
### Auto ls
functions --copy cd standard_cd
function cd
    standard_cd $argv; and ls
end

### Asciidoctor
function adoc
    asciidoctor -r asciidoctor-diagram $argv
end

function adocpdf
    asciidoctor-pdf -r asciidoctor-pdf-cjk -r asciidoctor-diagram $argv
end

### yq
function yqj
    yq eval -o=json $argv | pbcopy
end

## Fish
set fish_greeting

## fzf
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

## Ruby
set -x fish_user_paths /usr/local/opt/ruby/bin $fish_user_paths
set -x fish_user_paths $fish_user_paths /usr/local/lib/ruby/gems/2.7.0/bin

## Path
set PATH /usr/local/opt/avr-gcc@7/bin $PATH
