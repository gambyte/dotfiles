# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
bindkey '^[h' backward-kill-word
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

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U colors && colors
PROMPT="%{$fg_bold[red]%}>%{$reset_color%}"
RPROMPT="%{$fg[blue]%}%~%{$reset_color%} %{$fg[white]%}[%n@%m]%{$reset_color%} %{$fg[white]%}[%T]%{$reset_color%}"
[[ $INSIDE_EMACS ]] && unsetopt zle
setopt HIST_IGNORE_DUPS
zstyle ':completion:*' show-ambiguity "1;$color[fg-red]"
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
