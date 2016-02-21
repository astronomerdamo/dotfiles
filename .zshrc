# Path to your oh-my-zsh installation.
export ZSH=/Users/Damo/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="orion"

# oh-my-zsh plugins.
plugins=(gitfast brew virtualenvwrapper)

### User configuration

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Setup for FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set history size
HISTSIZE=65536
SAVEHIST=65536

# Aliases
alias brfull='bubu && brew doctor'
alias clear=" clear"
alias pwd=" pwd"

# Python
export WORKON_HOME=$HOME/.virtualenvs
source $(brew --prefix)/bin/virtualenvwrapper.sh

# Spark setup (conflicts with starscream)
# export PYSPARK_PYTHON=python3
# export PYSPARK_DRIVER_PYTHON=ipython

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

###

source $ZSH/oh-my-zsh.sh
