[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [[ -x /bin/urxvtd && $XDG_VTNR -eq 1 ]]; then
    /bin/urxvtd -q -f -o
fi
setxkbmap dvorak
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
if [ -x /bin/xcape ]; then
    /bin/xcape -e "Shift_L=parenleft;Shift_R=parenright;Control_R=space;Control_L=space"
fi
if [ -x /bin/numlockx ]; then
    /bin/numlockx &
fi
# xset r off

if [ -x /bin/dunst ]; then
    /bin/dunst &
fi

if [ -x ~/.fehbg ]; then
    ~/.fehbg &
fi

exec stumpwm
