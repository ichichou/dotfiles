## Aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm 'rmtrash'

alias b 'brew'
alias bc 'brew cask'
alias g 'git'
alias gu 'gitup'
alias tree 'tree -NC'
alias vi 'vim'
alias j 'z'

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

### fasd
# alias a 'fasd -a'
# alias s 'fasd -si'
# alias d 'fasd -d'
# alias f 'fasd -f'
# alias sd 'fasd -sid'
# alias sf 'fasd -sif'
# alias j 'fasd_cd -d'
# alias jj 'fasd_cd -d -i'
# alias v 'fasd -f -e vim'

## Functions
### git
function gcmm
    command git commit $argv[1] --message $argv[2]
end

## Plugins
### Fish
set fish_greeting

### Fzf
set -U FZF_LEGACY_KEYBINDINGS 0

### Base16
# if status --is-interactive
#     set BASE16_SHELL "$HOME/.config/base16-shell"
#     source "$BASE16_SHELL/profile_helper.fish"
# end

