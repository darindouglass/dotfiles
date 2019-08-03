# General
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
shopt -s histappend

export VISUAL=emacsclient
export EDITOR="$VISUAL"

# Git
source ~/.git-completion.bash

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

if [ -r $(brew --prefix)/etc/bash_completion.d/git ]; then
    source $(brew --prefix)/etc/bash_completion.d/git
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
    #__git_complete gu _git_branch
fi
