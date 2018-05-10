export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

alias sd='setdefault'
alias setdefault='npmrc default'

# find
alias f="find . -iname"

# rm
alias rmi="rm -i"
alias rm="rm -i"

# ls
alias l="ls"
alias ll="ls -lAhG"
alias la="ls -A"

# ls - Hidden
alias lh="ls -d .*"

# cd
CD_BACK="cd .."

alias ..="${CD_BACK}"
alias cd..="${CD_BACK}"

# Home
alias home="cd ~"
alias apps="cd ~/workspace"
alias dock="cd ~/devdocker"

# vagrant
alias vag="cd ~/workspace/vagrant"
alias vssh='(cd ~/workspace/vagrant; vagrant ssh)'
alias vup='(cd ~/workspace/vagrant; vagrant up)'
alias vdn='(cd ~/workspace/vagrant; vagrant halt)'

#clear
alias cls="clear"
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE="1" # Display unstaged (*) and staged(+) changes

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
  tput sgr0

  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    BASE03=$(tput setaf 234)
    BASE02=$(tput setaf 235)
    BASE01=$(tput setaf 240)
    BASE00=$(tput setaf 241)
    BASE0=$(tput setaf 244)
    BASE1=$(tput setaf 245)
    BASE2=$(tput setaf 254)
    BASE3=$(tput setaf 230)
    YELLOW=$(tput setaf 136)
    ORANGE=$(tput setaf 166)
    RED=$(tput setaf 160)
    MAGENTA=$(tput setaf 125)
    VIOLET=$(tput setaf 61)
    BLUE=$(tput setaf 33)
    CYAN=$(tput setaf 37)
    GREEN=$(tput setaf 64)
  else
    BASE03=$(tput setaf 8)
    BASE02=$(tput setaf 0)
    BASE01=$(tput setaf 10)
    BASE00=$(tput setaf 11)
    BASE0=$(tput setaf 12)
    BASE1=$(tput setaf 14)
    BASE2=$(tput setaf 7)
    BASE3=$(tput setaf 15)
    YELLOW=$(tput setaf 3)
    ORANGE=$(tput setaf 9)
    RED=$(tput setaf 1)
    MAGENTA=$(tput setaf 5)
    VIOLET=$(tput setaf 13)
    BLUE=$(tput setaf 4)
    CYAN=$(tput setaf 6)
    GREEN=$(tput setaf 2)
  fi

  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  # Linux console colors. I don't have the energy
  # to figure out the Solarized values
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

# Git branch in prompt.
function git_color {
  local git_status="$(git status 2> /dev/null)"
    if [[ ! $git_status =~ "working tree clean" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  else
    echo -e $RESET
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "`__git_ps1`"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "`__git_ps1`"
  fi
}

# Broken current path
export MYPS="[\@] \u:\w"

# export PS1="\w\[$GREEN\] \$(parse_git_branch)\[$RESET\] $ "
PS1="\n"
PS1+="\[$WHITE\]$(eval 'echo ${MYPS}')" # basename of pwd
PS1+="\[\$(git_color)\]" # colors git status
PS1+=" \$(git_branch)" # prints current branch
PS1+="\[$RESET\]\n$ " # '#' for root, else '$'
export PS1

export CLICOLOR=1

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

echo ".bash_profile reloaded"
