# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
bindkey '^[h' backward-kill-word
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
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
[ -d ~/builds/ ] && alias pacaur='SRCDEST=~/builds/ pacaur'
alias update='pacaur -Syyu --noconfirm --noedit'
alias m='ncmpcpp'
export EDITOR="emacsclient"
export SUDO_EDITOR="emacsclient"
export ALTERNATE_EDITOR="emacs"
export DIFFPROG="emacs -nw --no-server --no-secrets -diff"
export LESS="-RSMsi"

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U colors && colors

PROMPT="%{$fg_bold[red]%}>%{$reset_color%}"

if [[ $INSIDE_EMACS ]]; then
    function emacs-man()
    {
	emacsclient -e "(let ((Man-notify-method 'aggressive)) (man \"$*\"))"
    }
    alias man='emacs-man'
    function emacs-proced()
    {
	emacsclient -e "(progn (proced) (proced-filter-interactive (intern \"${1:-user}\")))"
    }
    alias proced='emacs-proced'
    function emacs-dired()
    {
	local args="${@:2}"
	emacsclient -e "(dired \"${1:-$PWD}\" ${args:+\"$args\"})"
    }
    alias dired='emacs-dired'
    function emacs-magit()
    {
	emacsclient -e "(magit-status ${1:+\"$1\"})"
    }
    alias magit='emacs-magit'
    export BROWSER="${HOME}/.emacs.d/eww.sh"
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
    RPROMPT="%{$fg[blue]%}%~%{$reset_color%} %{$fg[white]%}[%n@%m]%{$reset_color%} %{$fg[white]%}[%T]%{$reset_color%}"
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
    alias magit='emacs -nw --no-server --no-secrets -magit'
fi
setopt HIST_IGNORE_DUPS
zstyle ':completion:*' show-ambiguity "1;$color[fg-red]"

if [[ $TERM == dumb ]]; then
    unsetopt zle
    export PAGER="/bin/cat"
    if [[ $INSIDE_EMACS ]]; then
	alias ls='env TERM=xterm ls -v --color=auto'
	alias htop='emacs-proced'
	alias top='emacs-proced'
	function emacs-clear()
	{
	    emacsclient -e "(with-current-buffer \"*shell*\"
(comint-kill-region (point-min) (point)))" > /dev/null
	}
	alias clear='emacs-clear'
    fi
else
    export PAGER="/bin/less"
fi

set -u
stty -ixon
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate _prefix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '+m:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '' '+l:|=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/graham/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
