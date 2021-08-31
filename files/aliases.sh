# General
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# Add an "alert" alias for long running commands.  Use like so: [sleep 10; alert]
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias alg='alias -p | grep'
alias back='cd -'
alias cl='clear'
alias fn="find . -name"
alias gr="ag --color-path 1\;36"
alias l='ls -al'
alias jpp="pbpaste | jq '.' | pbcopy"
alias psg='ps aux | grep'
alias src='source ~/.zshrc'
alias td='tmux detach'
alias tf='tail -F'
alias tw='td && ta'

# Git
alias del='git del'
alias ga='git add'
alias gaa='git add --all'
alias gbrn='git br -m'
alias gcb='git cob'
alias gcd='git rev-list --left-right --count master..'
alias gco='git co'
alias gcp='git cp'
alias gcpm='git cp -m1'
alias gd='git diff'
alias gdn='git down'
alias gf='git fetch -p'
alias gl='git log --decorate'
alias glp='git log -p'
alias gls='git ls'
alias gll='git ll'
alias gob=". ~/bin/git-stale-branches"
alias gp='git push'
alias gs='git sh'
alias gss='git sh show'
alias gsp='git sh pop'
alias lbr='git br'
alias master='gco master'
alias st='git st'

# kube
alias wp='watch kubectl get pods'
