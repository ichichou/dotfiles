if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# ENVIRONMENT VARIABLES --------------------------

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
