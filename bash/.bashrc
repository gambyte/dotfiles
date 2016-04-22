#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -v --color=auto'
alias lt='ls -t'
alias ll='ls -lh'
alias llt='ls -lht'
alias la='ls -a'
alias lat='ls -at'
alias lla='ls -lha'
alias llat='ls -lhat'
alias sudo='sudo '
alias open='xdg-open'
alias da='date "+%A, %B %d, %Y [%T]"'
alias mkdir='mkdir -p -v'
alias ping='ping -c 3'
alias df='df -h'
alias du='du -c -h'
alias du1='du --max-depth=1'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias rcp='rsync --progress --size-only --inplace --verbose'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
PS1='[\u@\h \W]\$ '
alias update='pacaur -Syyu --noconfirm --noedit'
alias magit='emacs -nw -magit'
alias m='ncmpcpp'
alias e='emacsclient -t -a zile'
export EDITOR="emacsclient -a zile"
export SUDO_EDITOR="emacsclient -a zile"
export DIFFPROG="emacs -nw -diff"
export LESS="-RSMsi"
export PAGER="/bin/less"
if [ -n "$DISPLAY" ]; then
    export BROWSER=chromium
else
    export BROWSER=links
fi

export C_INCLUDE_PATH=/usr/lib/libffi-3.2.1/include

function clearram()
{
    sync && echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null;
}

set -u
