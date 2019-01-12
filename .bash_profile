if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if type fish > /dev/null 2>&1; then
    exec fish
fi
