# Prompt
RED='\[$(tput setaf 1)\]'
GREEN='\[$(tput setaf 2)\]'
YELLOW='\[$(tput setaf 3)\]'
BLUE='\[$(tput setaf 4)\]'
WHITE='\[$(tput setaf 7)\]'
RESET='\[$(tput sgr0)\]'

# Get current branch in git repo and determine if dirty or clean
function parse_git_branch(){
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ ! ${BRANCH} == "" ]; then
    STATE=$(git status --porcelain 2> /dev/null | wc -l | tr -d " ")
    if [ ${STATE} == 0 ]; then
      GIT_STATE=${GREEN}✔
    else
      GIT_STATE=${RED}✗
    fi
    echo "${YELLOW}${BRANCH} ${GIT_STATE}${RESET}"
  else
    echo ""
  fi
}

function set_bash_prompt(){
	PS1="${BLUE}\w${RESET} $(parse_git_branch)\n${WHITE}\A ${GREEN}λ${RESET} "
}

PROMPT_COMMAND=set_bash_prompt

# Pull aliases
[[ -a ~/Developer/dotfiles/bash/.bash_aliases ]] && source ~/Developer/dotfiles/bash/.bash_aliases

# Pull functions
[[ -a ~/Developer/dotfiles/bash/.bash_functions ]] && source ~/Developer/dotfiles/bash/.bash_functions

# Make vim the default editor
export EDITOR="vim"

# Larger bash history 2^16
export HISTSIZE=65536
export HISTFILE=~/.bash_history
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoreboth

# Disregard following commands from history
export HISTIGNORE="exit:clear:history:ls:la:ll"

# Append history when shell exists
shopt -s histappend

# Highlight section titles in manual pages
export LESS_TERMCAP_md=$'\e[0;33m'

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Spark setup (conflicts with starscream)
export PYSPARK_PYTHON=python3
export PYSPARK_DRIVER_PYTHON=ipython

# Setup for FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# GitHub Personal Token
