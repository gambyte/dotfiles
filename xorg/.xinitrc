[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
urxvtd -q -f -o
setxkbmap dvorak
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xcape -e "Shift_L=parenleft;Shift_R=parenright;Control_R=space;Control_L=space"
numlockx &
[[ -f /usr/bin/synclient ]] && synclient TouchpadOff=1

exec awesome
