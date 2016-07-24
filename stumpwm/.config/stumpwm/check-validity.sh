#!/bin/bash

function checker(){
    2>/dev/null git --git-dir="$HOME/$1/.git" verify-commit HEAD
}

if checker dotfiles && checker .emacs.d \
   && [ ! -f ~/.stumpwmrc ] \
   && [ ! -d ~/.stumpwm.d ]; then
    echo -n "I am always doing things I can't do. That is how I get to do them."
else
    echo -n "*Warning: dotfiles may be compromised!!*"
fi
