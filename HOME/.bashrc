# Prompt
RED=`tput setaf 1`
GREEN=`tput setaf 2`
ORANGE=`tput setaf 3`
BLUE=`tput setaf 4`
RESET=`tput sgr0`

# Get current branch in git repo and determine if dirty or clean
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]; then
    STATE=`git status --porcelain 2> /dev/null | wc -l | tr -d " "`
    if [ ${STATE} == 0 ]; then
      GIT_STATE="${GREEN}✔"
    else
      GIT_STATE="${RED}✗"
    fi
    echo "${ORANGE}${BRANCH} ${GIT_STATE}${RESET}"
  else
    echo ""
  fi
}

export PS1="${BLUE}\w${RESET} \`parse_git_branch\`\n\A ${GREEN}λ${RESET} "

# Pull aliases
[[ -a ~/.bash_aliases ]] && source ~/.bash_aliases

# Make vim the default editor
export EDITOR="vim"

# Larger bash history 2^16
export HISTSIZE=65536
export HISTFILE=~/.bash_history
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoreboth

# Disregard following commands from history
export HISTIGNORE="exit:clear:history:ls:la:ll"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Spark setup (conflicts with starscream)
# export PYSPARK_PYTHON=python3
# export PYSPARK_DRIVER_PYTHON=ipython

# Python
export WORKON_HOME=$HOME/.virtualenvs
source $(brew --prefix)/bin/virtualenvwrapper.sh

# Ruby Env
eval "$(rbenv init -)"

# Shopify
alias cluster='PYTHON_ENV=remote_development'
export HADOOP_CONF_DIR=~/Developer/starscream/.cache/spark/current/conf/conf.cloudera.yarn
export HADOOP_USER_NAME="damienrobertson"
# export NO_AUTOAUTOLINT=true
export VAGRANT_CWD=~/Developer/vagrant
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Setup for FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# GitHub Personal Token
