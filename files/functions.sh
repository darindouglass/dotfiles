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

function dr {
    git diff $(git push --dry-run origin $1 2>&1 | tail -n 1 | tr -s ' ' | cut -d ' ' -f 2)
    echo "git push origin $1"
}

function gci {
    br_name="$(git rev-parse --abbrev-ref HEAD)"

    if [[ ! "$br_name" =~ "master" ]]; then
        split_br=(${br_name//-/ })
        additional_text=""

        if [ $# -eq 1 ] && [[ "$1" =~ "pr" ]]; then
            additional_text="Address PR comments"
        else
            additional_text=$(join_by " " ${split_br[@]:2})
        fi

        key="$(echo ${split_br[0]}| tr /a-z/ /A-Z/)-${split_br[1]}"
        echo "[${key}] ${additional_text}" > ~/.gitmessage
        git ci
    else
        echo "" > ~/.gitmessage
    fi
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
