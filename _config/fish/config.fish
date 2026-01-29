# -- Environment Variables {{{

set -gx fish_greeting
set -gx LANG ja_JP.UTF-8
set -gx EDITOR vim
set -gx XDG_CONFIG_HOME ~/.config
set -gx GOOGLE_CLOUD_PROJECT my-gemini-project-465104

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
abbr -a d    cd
abbr -a e    exit
abbr -a lns  ln -snfv
abbr -a nd   nextd
abbr -a pd   prevd
abbr -a rmds rm .DS_Store
abbr -a so   source
abbr -a ud   cd ..

abbr -a cp  cp -iv
abbr -a cpr cp -ivr
abbr -a mv  mv -iv
abbr -a mvr mv -ivr

# Apps
abbr -a R    R --quiet --no-save
abbr -a a    bat
abbr -a awk  gawk
abbr -a csv  csvlens
abbr -a diff batdiff
abbr -a duck duckdb
abbr -a grep batgrep
abbr -a hs   ghci
abbr -a j    z
abbr -a man  batman
abbr -a n    numbat
abbr -a nvi  nvim
abbr -a r    r --quiet --no-save
abbr -a ra   ranger
abbr -a sed  gsed
abbr -a t    tig
abbr -a ts   tig status
abbr -a yqj  yq eval -o=json
abbr -a yqy  yq eval -P

abbr -a vi vim

# eza/ls
if test -e "/opt/homebrew/bin/eza"
  abbr -a ls eza -a --group-directories-first
  abbr -a la eza -al --git --time-style iso --group-directories-first
  abbr -a ll eza -1a --group-directories-first
else
  abbr -a ls ls -AG
  abbr -a la ls -AlG
  abbr -a ll ls -1AG
end

# trash/rm
if test -e "/opt/homebrew/opt/trash/bin/trash"
  abbr -a rm trash
else
  abbr -a rm rm -iv
end

# zk
abbr -a k  zk
abbr -a kj zk journal
abbr -a kc zk config
abbr -a ke zk edit -i
abbr -a kl zk list -i
abbr -a kn zk new --no-input

# Homebrew
abbr -a b    brew

abbr -a bc   brew cleanup
abbr -a bd   brew doctor
abbr -a bg   brew upgrade
abbr -a bi   brew info
abbr -a bin  brew install
abbr -a bl   brew list
abbr -a bo   brew outdated
abbr -a brm  brew autoremove
abbr -a bs   brew search
abbr -a bu   brew update
abbr -a bun  brew uninstall

abbr -a --command brew c  cleanup
abbr -a --command brew d  doctor
abbr -a --command brew g  upgrade
abbr -a --command brew i  info
abbr -a --command brew in install
abbr -a --command brew l  list
abbr -a --command brew o  outdated
abbr -a --command brew rm autoremove
abbr -a --command brew s  search
abbr -a --command brew u  update
abbr -a --command brew un uninstall

# Git
abbr -a g   git

abbr -a ga  git add
abbr -a gb  git branch
abbr -a gc  git commit
abbr -a gcl git clone
abbr -a gd  git diff
abbr -a gf  git fetch
abbr -a gl  git log --graph --oneline -n 10
abbr -a glp git log --patch -n 10
abbr -a gm  git merge
abbr -a gpl git pull
abbr -a gps git push
abbr -a grb git rebase
abbr -a grf git reflog
abbr -a grs git restore
abbr -a grv git revert
abbr -a gs  git status --short --branch
abbr -a gsh git show
abbr -a gss git status
abbr -a gst  git stash
abbr -a gsw  git switch

abbr -a --command git a  add
abbr -a --command git b  branch
abbr -a --command git c  commit
abbr -a --command git cl clone
abbr -a --command git d  diff
abbr -a --command git f  fetch
abbr -a --command git l  log --graph --oneline -n 10
abbr -a --command git lp log --patch -n 10
abbr -a --command git m  merge
abbr -a --command git pl pull
abbr -a --command git ps push
abbr -a --command git rb rebase
abbr -a --command git rf reflog
abbr -a --command git rs restore
abbr -a --command git rv revert
abbr -a --command git s  status --short --branch
abbr -a --command git sh show
abbr -a --command git ss status
abbr -a --command git st stash
abbr -a --command git sw switch

# }}}

# -- Functions {{{

# Auto ls ----------------------------------------

# 'Use $PWD' を使い、'Use $status' は使わない。
# cd コマンドを上書きする形の実装では dir history が更新されず、
# prevd や nextd が使用不能になるため。
# $PWD の更新に伴って ls を実行する形の実装なら問題ない。

# Use $PWD
function auto_ls --on-variable PWD
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

# # Use $status
# function cd
#   builtin cd $argv
#   if test $status -eq 0
#     if test (ls -A | count) -gt 50
#       echo "(>50 items exist in $(basename $PWD)/)"
#     else
#       if test -e "/opt/homebrew/bin/eza"
#         eza -a --group-directories-first
#       else
#         ls -AG
#       end
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

abbr -a jo journal

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
  --preview 'bat --number --color always {}' \
  --preview-window 'right,75%,wrap,<100(right,50%,wrap)'"

# CTRL-Y to copy the command into clipboard using pbcopy
set -gx FZF_CTRL_R_OPTS "\
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' \
  --color header:italic \
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
set -gx FZF_ALT_C_OPTS "\
  --walker-skip .git,node_modules,target \
  --preview 'eza -T {}'"

# Numbat -----------------------------------------

set -gx NUMBAT_MODULES_PATH ~/.config/numbat

# bat --------------------------------------------

set -gx BATDIFF_USE_DELTA true

# }}}
