# Prompt

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "git:${BRANCH}${STAT} "
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

#export PS2="\W \`parse_git_branch\` "
export PS1="\[\e[34m\]\W/\[\e[0m\] \[\e[33m\]\`parse_git_branch\`\[\e[0m\]\n\[\e[31m\]-- \[\e[32m\]λ\[\e[0m\] "

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
export NO_AUTOAUTOLINT=true
export VAGRANT_CWD=~/Developer/vagrant
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Setup for FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# GitHub Personal Token
