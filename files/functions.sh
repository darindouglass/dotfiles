function ips {
    RED='\033[00;31m'
    GREEN='\033[00;32m'
    RESET='\033[00m'

    for i in `seq 1 255`; do
        IP=$1.$i
        RES=$(ping -c 1 -W 1 $IP | tr \\n ' ')
        if echo $RES | grep -q '1 packets received'; then
            echo -e "[ ${RED}TAKEN${RESET} ] $IP";
        else
            echo -e "[ ${GREEN}AVAIL${RESET} ] $IP";
        fi
    done

    unset RED
    unset GREEN
    unset RESET
}

function join_by {
    local IFS="$1";
    shift;
    echo "$*";
}

function mkd {
    mkdir $1
    cd $1
}

function ra {
    for FILE in `grep -Irl $1 $3`
    do
        perl -pi -e "s|$1|$2|" $FILE
    done
}

function wwc {
    tail -F $1 | egrep --color "$2|$"
}

function start_agent {
  local SSH_ENV="$HOME/.ssh/environment"

  echo "Initialising new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo "Success"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
}

function bd {
  echo $1 | base64 --decode
}

function dr {
    git diff $(git push --dry-run origin $1 2>&1 | tail -n 1 | tr -s ' ' | cut -d ' ' -f 2)
    echo "git push origin $1"
}

function gci {
    branch="$(git rev-parse --abbrev-ref HEAD)"

    if [[ ! "$branch" == "master" ]]; then
        parts=("${(@s/-/)branch}")
        suffix=$(join_by " " ${parts[@]:2})

        if $(echo $parts[2] | grep -vq '[0-9]'); then
          # echo "$parts" > ~/.gitmessage
          echo "$@" > ~/.gitmessage
        else
          key="$(echo ${parts[1]} | tr /a-z/ /A-Z/)-${parts[2]}"
          # echo "[$key] $suffix" > ~/.gitmessage
          echo "[$key] $@" > ~/.gitmessage
          #echo "[$key] " > ~/.gitmessage
        fi

        git ci
    fi
}

function gcm {
    branch="$(git rev-parse --abbrev-ref HEAD)"

    prefix=""
    if [[ ! "$branch" == "master" ]]; then
        parts=("${(@s/-/)branch}")
        suffix=$(join_by " " ${parts[@]:2})

        key="$(echo ${parts[1]} | tr /a-z/ /A-Z/)-${parts[2]}"
        prefix="[$key] "
    fi

    git commit -m "$prefix$@"
}


function grb {
    git rebase -i HEAD~$1
}

function gu {
    if [ $# -eq 0 ] || [[ "$1" =~ "this" ]]; then
        br_name="$(git rev-parse --abbrev-ref HEAD)"
    else
        br_name="$1"
    fi
    git up $br_name
}

function lsjava() {
  /usr/libexec/java_home -V 2>&1 |\
    grep 'x86_64' |\
    sed -E 's/ *([0-9\._]*),.* *\"(.*)\".*/\1:\2/' |\
    column -t -s ':'
}

function usejava() {
  local home=$(/usr/libexec/java_home -v $1)
  if [[ -d $home ]]; then
    export JAVA_HOME=$home
  fi
}

function t() {
  if [[ $# = 0 ]]; then
    if [[ -n $TMUX ]]; then
      local this_session=$(tmux display-message -p "#S")
      echo "$this_session (current)"
      tmux list-session -F '#S' | grep -v $this_session
    else
      tmux list-session -F '#S'
    fi
  else
    tmux -2 new-session -ADs $1
  fi
}
