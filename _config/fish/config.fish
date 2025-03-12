# -- Environment Variables {{{

set -gx fish_greeting
set -gx LANG ja_JP.UTF-8
set -gx EDITOR vim
set -gx XDG_CONFIG_HOME ~/.config

# # LS_COLORS
#
# # Exec below command:
# >_ set -Ux LS_COLORS (vivid generatte catppuccin-macchiato)
#
# # Don't use below code:
# if test -e "/opt/homebrew/bin/vivid"
#   set -gx LS_COLORS (vivid generate catppuccin-macchiato)
# end

# }}}

# -- Path {{{

fish_add_path /opt/homebrew/opt/icu4c/bin
fish_add_path /opt/homebrew/opt/trash/bin
fish_add_path $HOME/command
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.juliaup/bin

# }}}

# -- Keybind {{{

bind -e \cj
bind -e \cl

# Vim mode ---------------------------------------

# # Exec manually: >_ fish_user_key_bindings
# # function fish_user_key_bindings
#   for mode in default insert visual
#     fish_default_key_bindings -M $mode
#   end
#   fish_vi_key_bindings --no-erase
# end

# # Vim mode's Cursor shape
# set -gx fish_cursor_default     block
# set -gx fish_cursor_insert      line
# set -gx fish_cursor_visual      block
# set -gx fish_cursor_replace     underscore
# set -gx fish_cursor_replace_one underscore
# set -gx fish_cursor_external    line

# }}}

# -- Abbr {{{

# General
abbr -ag d    cd
abbr -ag e    exit
abbr -ag lns  ln -snfv
abbr -ag nd   nextd
abbr -ag pd   prevd
abbr -ag rmds rm .DS_Store
abbr -ag so   source
abbr -ag ud   ..

abbr -ag cp cp -iv
abbr -ag mv mv -iv

# Apps
abbr -ag a   bat
abbr -ag hs  ghci
abbr -ag n   numbat
abbr -ag nvi nvim
abbr -ag r   r --quiet --no-save
abbr -ag ra  ranger
abbr -ag t   tig
abbr -ag ts  tig status
abbr -ag yqj yq eval -o=json
abbr -ag yqy yq eval -P

abbr -ag vi vim

# eza/ls
if test -e "/opt/homebrew/bin/eza"
  abbr -ag ls eza -a --group-directories-first
  abbr -ag la eza -al --git --time-style iso --group-directories-first
  abbr -ag ll eza -1a --group-directories-first
else
  abbr -ag ls ls -AG
  abbr -ag la ls -AlG
  abbr -ag ll ls -1AG
end

# trash/rm
if test -e "/opt/homebrew/opt/trash/bin/trash"
  abbr -ag rm trash
else
  abbr -ag rm rm -iv
end

# z
abbr -ag j  z
abbr -ag jd z dotfiles
abbr -ag jl z downloads
abbr -ag jr z repos
abbr -ag jk z zk

# zk
abbr -ag k  zk
abbr -ag kc zk config
abbr -ag ke zk edit -i
abbr -ag kg zk git_status
abbr -ag kl zk list -i
abbr -ag kn zk new

abbr -ag kj  zk journal
abbr -ag kje zk edit -i journal
abbr -ag kjl zk list -i journal
abbr -ag kjn zk new journal
abbr -ag kjs zk save_journal

abbr -ag kd  zk edit -i draft
abbr -ag kde zk edit -i draft
abbr -ag kdl zk list -i draft
abbr -ag kdn zk new draft
abbr -ag kds zk save_draft

# Homebrew
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
abbr -ag bug  "brew update; and brew upgrade"
abbr -ag bun  brew uninstall
abbr -ag buse brew uses

# Git
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
abbr -ag grb git rebase
abbr -ag grf git reflog
abbr -ag grs git restore
abbr -ag grv git revert
abbr -ag gs  git status --short --branch
abbr -ag gsh git show
abbr -ag gss git status
abbr -ag gw  git switch

# }}}

# -- Functions {{{

# Auto ls ----------------------------------------

# Use $status
function cd
  builtin cd $argv
  if test $status -eq 0
    if test (ls -A | count) -gt 50
      echo "(>50 items exist in $(basename $PWD)/)"
    else
      if test -e "/opt/homebrew/bin/eza"
        eza -a --group-directories-first
      else
        ls -AG
      end
    end
  end
end

# # Use $PWD
# function auto_ls --on-variable PWD
#   if test (ls -A | count) -gt 50
#     echo "(>50 items exist in $(basename $PWD)/)"
#   else
#     if test -e "/opt/homebrew/bin/eza"
#       eza -a --group-directories-first
#     else
#       ls -AG
#     end
#   end
# end

# Journal ----------------------------------------

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

abbr -ag jo journal

# Find & remove .DS_STORE ------------------------

function dsstore
  if test -e "/opt/homebrew/bin/fd"
    fd -H '^\.DS_Store$' -tf -X rm
  else
    find . -name '.DS_Store' -type f -delete
  end
end

# }}}

# -- Apps {{{

# pure -------------------------------------------

set -gx pure_show_jobs true
set -gx pure_symbol_prompt ▶
set -gx pure_symbol_reverse_prompt ◀
# set -gx pure_symbol_prompt fsh ▶
# set -gx pure_symbol_reverse_prompt fsh ◀

# fzf --------------------------------------------

fzf --fish | source

# Preview file content using bat
set -gx FZF_CTRL_T_OPTS "\
  --walker-skip .git,node_modules,target \
  --preview 'bat -n --color=always {}' \
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-Y to copy the command into clipboard using pbcopy
set -gx FZF_CTRL_R_OPTS "\
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' \
  --color header:italic \
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
set -gx FZF_ALT_C_OPTS "\
  --walker-skip .git,node_modules,target \
  --preview 'eza -T {}'"

# zk ---------------------------------------------

set -gx ZK_NOTEBOOK_DIR ~/repos/zk

# Numbat -----------------------------------------

set -gx NUMBAT_MODULES_PATH ~/.config/numbat

# }}}
