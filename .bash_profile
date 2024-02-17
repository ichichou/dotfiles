if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if type fish > /dev/null 2>&1; then
    exec fish
fi

# Environment Variables
. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/Users/kazu/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/kazu/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
