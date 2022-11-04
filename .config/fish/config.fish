## Abbr
abbr -ag cp cp -iv
abbr -ag e exit
abbr -ag lns ln -snfv
abbr -ag mv mv -iv
abbr -ag nd nextd
abbr -ag pd prevd
abbr -ag reload exec fish

### Apps
abbr -ag ba bat
abbr -ag j z
abbr -ag mvi mvim
abbr -ag nvi nvim
abbr -ag r radian
abbr -ag t tig
abbr -ag ts tig status
abbr -ag vi vim
abbr -ag yqj yq eval -o=json

if test -e "/opt/homebrew/bin/trash"
    or test -e "/usr/local/bin/trash"
    abbr -ag rm trash
    abbr -ag rmds trash .DS_Store
else
    abbr -ag rm rm -iv
    abbr -ag rm rm -iv .DS_Store
end

if test -e "/opt/homebrew/bin/exa"
    or test -e "/usr/local/bin/exa"
    abbr -ag ls exa -a
    abbr -ag ll exa -1a
    abbr -ag la exa -al --git
else
    abbr -ag ls ls -AG
    abbr -ag ll ls -1AG
    abbr -ag la ls -AlG
end

### memo
abbr -ag m memo
abbr -ag mn memo new
abbr -ag me memo edit
abbr -ag mc memo cat
abbr -ag mg memo grep
abbr -ag ms memo serve

### zk
abbr -ag k zk

### Homebrew
abbr -ag b brew
abbr -ag bls brew list
abbr -ag bu brew update
abbr -ag bug brew upgrade
abbr -ag bo brew outdated
abbr -ag bs brew search
abbr -ag bi brew info
abbr -ag bin brew install
abbr -ag bun brew uninstall
abbr -ag bdep brew deps
abbr -ag buse brew uses
abbr -ag bc brew cleanup
abbr -ag brm brew autoremove
abbr -ag bd brew doctor

### Git
abbr -ag g git
abbr -ag ga git add
abbr -ag gaa git add --all
abbr -ag gbr git branch
abbr -ag gbra git branch --all
abbr -ag gbrd git branch --delete
abbr -ag gcl git clone
abbr -ag gcm git commit
abbr -ag gcma git commit --all
abbr -ag gco git checkout
abbr -ag gcob git checkout -b
abbr -ag gdi git diff
abbr -ag gdit git difftool
abbr -ag gfe git fetch
abbr -ag gfep git fetch --prune
abbr -ag glg git log
abbr -ag glgf git log --graph --oneline --decorate --follow
abbr -ag glgg git log --graph --oneline --decorate
abbr -ag glgp git log --patch
abbr -ag gmg git merge
abbr -ag gmgt git mergetool
abbr -ag gmv git mv --verbose
abbr -ag gpl git pull
abbr -ag gps git push
abbr -ag gpsd git push --delete
abbr -ag gpsu git push --set-upstream
abbr -ag grl git reflog
abbr -ag gs git status --short --branch
abbr -ag gsh git show
abbr -ag gss git status

## Keybinds
bind -e \cl
bind -e \cj
bind -e \cf

## Functions
### Auto ls
functions --copy cd standard_cd
function cd
    if test -e "/opt/homebrew/bin/exa"
        or test -e "/usr/local/bin/exa"
        standard_cd $argv; and exa -a
    else
        standard_cd $argv; and ls -AG
    end
end

## Path
fish_add_path /usr/local/opt/avr-gcc@7/bin
fish_add_path /Users/kazu/go/bin

## Fzf
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

## Zk
set -x ZK_NOTEBOOK_DIR ~/repos/zk

## Greeting
set fish_greeting
