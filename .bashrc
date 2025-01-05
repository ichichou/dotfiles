# ENVIRONMENT VARIABLES --------------------------

[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
. "$HOME/.cargo/env"

# >>> juliaup initialize >>> ---------------------

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
  *:/Users/kazu/.juliaup/bin:*)
    ;;

  *)
    export PATH=/Users/kazu/.juliaup/bin${PATH:+:${PATH}}
    ;;
esac

# <<< juliaup initialize <<< ---------------------
