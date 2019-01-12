## Aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm 'rmtrash'

alias b 'brew'
alias bc 'brew cask'
alias g 'git'
alias gu 'gitup'
alias j 'z'
alias tree 'tree -NC'
alias v 'vim'
alias vi 'vim'


## Functions
function ls
    command ls -aG $argv
end

function ll
    command ls -1aG $argv
end

function lla
    command exa -al --git $argv
end


## Plugins
### Fish
set fish_greeting

### Fzf
set -U FZF_LEGACY_KEYBINDINGS 0

### Base16
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

