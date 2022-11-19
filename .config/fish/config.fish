## Abbr
abbr -ag cp cp -iv
abbr -ag e exit
abbr -ag lns ln -snfv
abbr -ag mv mv -iv
abbr -ag nd nextd
abbr -ag pd prevd
abbr -ag reload exec fish

### Apps
abbr -ag a bat
abbr -ag fc vim ~/dotfiles/.config/fish/config.fish
abbr -ag mvi mvim
abbr -ag nvi nvim
abbr -ag r radian
abbr -ag t tig
abbr -ag ts tig status
abbr -ag vi vim
abbr -ag yqj yq -o=json
abbr -ag yqy yq -P

### exa/ls
if test -e "/opt/homebrew/bin/exa"
    abbr -ag la exa -al --git
    abbr -ag ll exa -1a
    abbr -ag ls exa -a
    abbr -ag lsa exa
else
    abbr -ag la ls -AlG
    abbr -ag ll ls -1AG
    abbr -ag ls ls -AG
    abbr -ag lsa ls
end

### trash/rm
if test -e "/opt/homebrew/bin/trash"
    abbr -ag rm trash
    abbr -ag rmds trash .DS_Store
else
    abbr -ag rm rm -iv
    abbr -ag rmds rm -iv .DS_Store
end

### z
abbr -ag j z
abbr -ag jd z dotfiles
abbr -ag jdl z downloads
abbr -ag jr z repos
abbr -ag jk z zk

### zk
abbr -ag k zk
abbr -ag kc zk config
abbr -ag ke zk edit -i
abbr -ag kl zk list -i
abbr -ag kn zk new

abbr -ag kj zk journal
abbr -ag kje zk edit journal -i
abbr -ag kjl zk list journal -i
abbr -ag kjn zk new journal
abbr -ag kjs zk save_journal

abbr -ag kd zk draft
abbr -ag kde zk edit draft -i
abbr -ag kdl zk list draft -i
abbr -ag kdn zk new draft
abbr -ag kds zk save_draft

### Homebrew
abbr -ag b brew
abbr -ag bc brew cleanup
abbr -ag bd brew doctor
abbr -ag bdep brew deps
abbr -ag bi brew info
abbr -ag bin brew install
abbr -ag bl brew list
abbr -ag bo brew outdated
abbr -ag brm brew autoremove
abbr -ag bs brew search
abbr -ag bu brew update
abbr -ag bug brew upgrade
abbr -ag bun brew uninstall
abbr -ag buse brew uses

### Git
abbr -ag g git
abbr -ag ga git add
abbr -ag gaa git add --all
abbr -ag gb git branch
abbr -ag gba git branch --all
abbr -ag gbd git branch --delete
abbr -ag gcl git clone
abbr -ag gcm git commit
abbr -ag gco git checkout
abbr -ag gcob git checkout -b
abbr -ag gd git difftool
abbr -ag gf git fetch
abbr -ag gfp git fetch --prune
abbr -ag gl git log --graph --oneline --decorate
abbr -ag glf git log --graph --oneline --decorate --follow
abbr -ag glp git log --patch
abbr -ag gmv git mv --verbose
abbr -ag gpl git pull
abbr -ag gps git push
abbr -ag gpsd git push --delete
abbr -ag gpsu git push --set-upstream
abbr -ag gr git reset HEAD
abbr -ag grh git reset --hard HEAD
abbr -ag grl git reflog
abbr -ag grm git rm
abbr -ag gs git status --short --branch
abbr -ag gsh git show
abbr -ag gss git status

## Function
### Auto ls
functions --copy cd standard_cd
function cd
    if test -e "/opt/homebrew/bin/exa"
        standard_cd $argv; and exa -a
    else
        standard_cd $argv; and ls -AG
    end
end

## Environment Variable
set -x EDITOR vim

### Fzf
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

### Zk
set -x ZK_NOTEBOOK_DIR ~/repos/zk

### Pure
set -x pure_show_jobs true

## Path
fish_add_path /usr/local/opt/avr-gcc@7/bin
fish_add_path /Users/kazu/go/bin

## Greeting
set fish_greeting

## Keybind
bind -e \cl
bind -e \cj
bind -e \cf
