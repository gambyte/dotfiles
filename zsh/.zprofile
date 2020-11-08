if [[ -z $DISPLAY && $XDG_VTNR -eq  1 ]]; then
    exec startx
elif [[ -z $DISPLAY && $XDG_VTNR -eq  2 ]]; then
    [[ -x /usr/bin/sway ]] && sway
fi
