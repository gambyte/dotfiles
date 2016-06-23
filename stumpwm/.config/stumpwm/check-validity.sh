#!/bin/bash

function checker(){
    2>/dev/null git --git-dir=$HOME/$1/.git verify-commit HEAD
}

if checker dotfiles && checker .emacs.d; then
    echo -n "Live long and prosper."
else
    echo -n "*Warning: dotfiles may be compromised!!*"
fi
