# APPS -------------------------------------------

[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

case ":$PATH:" in
  *:/Users/kazu/.juliaup/bin:*)
    ;;

  *)
    export PATH=/Users/kazu/.juliaup/bin${PATH:+:${PATH}}
    ;;
esac

# <<< juliaup initialize <<<
