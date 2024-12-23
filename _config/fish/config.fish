# ENVIRONMENT VARIABLES ------------------------------------

set -gx fish_greeting
set -gx EDITOR vim
set -gx ZK_NOTEBOOK_DIR ~/repos/zk
set -gx pure_show_jobs true

# FZF
set -gx FZF_DEFAULT_COMMAND "fd --type file --strip-cwd-prefix --hidden --follow --exclude .git"
# set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git/*'"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
# set -gx FZF_DEFAULT_OPTS "--height 40% --info=inline --border"
set -gx FZF_CTRL_T_OPTS "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
# set -gx FZF_CTRL_R_OPTS "--layout=reverse"

# LS_COLORS
if test -e "/opt/homebrew/bin/vivid"
  set -gx LS_COLORS (vivid generate iceberg-dark)
end

# PATH -----------------------------------------------------

fish_add_path /opt/homebrew/opt/icu4c/bin
fish_add_path $HOME/command
fish_add_path $HOME/go/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.juliaup/bin

# KEYBIND --------------------------------------------------

bind -e \cj
bind -e \cl

# ABBR -----------------------------------------------------

# GENERAL
abbr -ag cp cp -iv
abbr -ag e exit
abbr -ag lns ln -snfv
abbr -ag mv mv -iv
abbr -ag nd nextd
abbr -ag pd prevd
abbr -ag reload exec fish
abbr -ag rmds rm .DS_Store
abbr -ag ud cd ..

# APPS
abbr -ag a bat
abbr -ag n numbat
abbr -ag nvi nvim
abbr -ag r radian
abbr -ag ra ranger
abbr -ag t tig
abbr -ag ts tig status
abbr -ag vi vim
abbr -ag yqj yq eval -o=json
abbr -ag yqy yq eval -P

# USER FUNCTIONS
abbr -ag jo journal

# EZA / LS
if test -e "/opt/homebrew/bin/eza"
  abbr -ag la eza -al --git
  abbr -ag ll eza -1a
  abbr -ag ls eza -a
  abbr -ag lsa eza
else
  abbr -ag la ls -AlG
  abbr -ag ll ls -1AG
  abbr -ag ls ls -AG
  abbr -ag lsa ls
end

# TRASH / RM
if test -e "/opt/homebrew/bin/trash"
  abbr -ag rm trash
else
  abbr -ag rm rm -iv
end

# Z
abbr -ag j z
abbr -ag jd z dotfiles
abbr -ag jl z downloads
abbr -ag jr z repos
abbr -ag jk z zk

# ZK
abbr -ag k zk
abbr -ag kc zk config
abbr -ag ke zk edit -i
abbr -ag kg zk git_status
abbr -ag kl zk list -i
abbr -ag kn zk new

abbr -ag kj zk journal
abbr -ag kje zk edit -i journal
abbr -ag kjl zk list -i journal
abbr -ag kjn zk new journal
abbr -ag kjs zk save_journal

abbr -ag kd zk edit -i draft
abbr -ag kde zk edit -i draft
abbr -ag kdl zk list -i draft
abbr -ag kdn zk new draft
abbr -ag kds zk save_draft

# HOMEBREW
abbr -ag b    brew
abbr -ag bc   brew cleanup
abbr -ag bd   brew doctor
abbr -ag bdep brew deps
abbr -ag bg   brew upgrade
abbr -ag bi   brew info
abbr -ag bin  brew install
abbr -ag bl   brew list
abbr -ag bo   brew outdated
abbr -ag brm  brew autoremove
abbr -ag bs   brew search
abbr -ag bu   brew update
abbr -ag bug  brew upgrade
abbr -ag bun  brew uninstall
abbr -ag buse brew uses

# GIT
abbr -ag g   git
abbr -ag ga  git add
abbr -ag gb  git branch
abbr -ag gc  git commit
abbr -ag gcl git clone
abbr -ag gd  git difftool
abbr -ag gf  git fetch
abbr -ag gl  git log --graph --oneline -n 10
abbr -ag glp git log --patch -n 10
abbr -ag gm  git merge
abbr -ag gpl git pull
abbr -ag gps git push
abbr -ag grb  git rebase
abbr -ag grf git reflog
abbr -ag grs git restore
abbr -ag grv git revert
abbr -ag gs  git status --short --branch
abbr -ag gsh git show
abbr -ag gss git status
abbr -ag gw  git switch

# FUNCTIONS ------------------------------------------------

# AUTO LS
functions --copy cd standard_cd
function cd
  if test -e "/opt/homebrew/bin/eza"
    standard_cd $argv; and eza -a
  else
    standard_cd $argv; and ls -AG
  end
end

# JOURNAL
function journal
  set today (date +"%Y-%m-%d")
  set journal_file "$today.bike"
  set journal_dir "$HOME/Library/CloudStorage/Box-Box/Journal"
  set journal_path "$journal_dir/$journal_file"

  if test -e $journal_path
    open -a "bike" $journal_path
  else
    touch $journal_path; and open -a "bike" $journal_path
  end
end

# FIND & REMOVE .DS_STORE
function dsstore
  if test -e "/opt/homebrew/bin/fd"
    fd -H '^\.DS_Store$' -tf -X rm
  else
    find . -name '.DS_Store' -type f -delete
  end
end
