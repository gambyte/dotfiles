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
[ -d ~/builds/ ] && alias pacaur='SRCDEST=~/builds/ pacaur'
alias update='pacaur -Syyu --noconfirm --noedit'
alias magit='emacs -nw --no-server --no-secrets -magit'
alias m='ncmpcpp'
export EDITOR="emacsclient"
export SUDO_EDITOR="emacsclient"
export ALTERNATE_EDITOR="emacs"
export DIFFPROG="emacs -nw --no-server --no-secrets -diff"
export LESS="-RSMsi"

export C_INCLUDE_PATH=/usr/lib/libffi-3.2.1/include

if [[ $INSIDE_EMACS ]]; then
    function emacs-man()
    {
	emacsclient -e "(let ((Man-notify-method 'aggressive)) (man \"$*\"))"
    }
    alias man='emacs-man'
    function emacs-proced()
    {
	emacsclient -e "(let ((proced-filter 'user)) (proced))"
    }
    alias proced='emacs-proced'
    export BROWSER="${HOME}/.emacs.d/eww.sh"
    export SUDO_ASKPASS="${HOME}/.emacs.d/sudo_askpass.sh"
    if [ -x "${HOME}/.emacs.d/sudo_askpass.sh" ]; then
	export SUDO_ASKPASS="${HOME}/.emacs.d/sudo_askpass.sh"
	alias sudo='sudo -A '
	function clearram()
	{
	    sync && echo 3 | sudo -A tee /proc/sys/vm/drop_caches > /dev/null;
	}
    else
	alias sudo='sudo '
    fi
    alias e='emacsclient'
else
    if [ -n "$DISPLAY" ]; then
	export BROWSER=chromium
    else
	export BROWSER=links
    fi
    alias sudo='sudo '
    function clearram()
    {
	sync && echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null;
    }
    alias e='emacsclient -t'
fi

if [[ $TERM == dumb ]]; then
    export PAGER="/bin/cat"
    if [[ $INSIDE_EMACS ]]; then
	alias ls='env TERM=xterm ls -v --color=auto'
	alias htop='emacs-proced'
	alias top='emacs-proced'
	function emacs-clear()
	{
	    emacsclient -e "(with-current-buffer \"*shell*\"
(comint-kill-region (point-min) (point)))"
	}
	alias clear='emacs-clear'
    fi
else
    export PAGER="/bin/less"
fi

set -u
stty -ixon
