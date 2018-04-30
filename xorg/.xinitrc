[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -f -o
setxkbmap dvorak
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xcape -e "Shift_L=parenleft;Shift_R=parenright;Control_R=space;Control_L=space"
numlockx &
xset r off

if [ -x /bin/dunst ]; then
    dunst &
fi

if [ -x ~/.fehbg ]; then
    ~/.fehbg &
fi

exec stumpwm
