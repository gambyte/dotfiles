#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z {XDG_VTNR+x} ]]; then
    [[ -z ${DISPLAY+x} && $XDG_VTNR -eq  1 ]] && exec startx
fi
