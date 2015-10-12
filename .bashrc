 # ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

### General aliases ###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'
alias cl='clear'
alias fn="find -name"
alias gco="git co"
alias l='ls -al'
alias psg='ps aux | grep'
alias rd="rdesktop -g 1280x1024"
alias src='source ~/.bashrc'
alias tf='tail -F'

### Git aliases ###
alias ga='git add'
alias gcb='git cob'
alias gco='git co'
alias gcm='git cim'
alias gd='git diff'
alias del='git del'
alias gdn='git down'
alias gl='git log'
alias gls='git ls'
alias gll='git ll'
alias gp='git push'
alias gu='git up'
alias lbr='git br'
alias st='git st'

# git-completion entries for aliases/functions
if [ -r /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
    __git_complete ga _git_add
    __git_complete lbr _git_branch
    __git_complete del _git_branch
    __git_complete gco _git_checkout
    # __git_complete gcp _git_cherry_pick
    # __git_complete gd _git_diff
    # __git_complete gdc _git_diff
    # __git_complete gf _git_fetch
    # __git_complete gg _git_grep
    __git_complete gls _git_log
    __git_complete gll _git_log
    # __git_complete glg _git_log
    # __git_complete glp _git_log
    # __git_complete gls _git_log
    # __git_complete gp _git_pull
    # __git_complete gpr _git_pull
    # __git_complete gr _git_rebase
    # __git_complete gs _git_show
    # __git_complete gw _git_whatchanged
    __git_complete gu _git_branch
fi

export VISUAL=emacs
export EDITOR="$VISUAL"

### Git functions
function gci {
    br_name="$(git rev-parse --abbrev-ref HEAD)"

    if [[ ! "$br_name" =~ "master" ]]; then
        split_br=(${br_name//_/ })
        echo [${split_br[0]}] > ~/.gitmessage
        git ci
    else
        echo "" > ~/.gitmessage
    fi
}

function e {
    emacsclient -n -a="/usr/bin/emacs" $1 &
}

function mkd {
    mkdir $1
    cd $1
}

function mstsc {
    rdesktop -g 1280x1024 -u "$1" -p $2 $3
}

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

source ~/.git-completion.bash
HOST=`hostname -f | awk -F. '{print $1}'`
export GIT_PS1_SHOWDIRTYSTATE=1

### Prompt style
export PS1='\033[1;32m\u@\h \033[1;34m\W\033[1;35m$(__git_ps1 " (%s)") \033[1;37m\$ '

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
