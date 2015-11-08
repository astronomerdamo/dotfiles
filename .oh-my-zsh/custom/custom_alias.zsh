alias brfull='bubu && brew doctor'

# Starscream specific environment variable
alias cluster='PYTHON_ENV=remote_development'
export WORKON_HOME=$HOME/.virtualenvs
source $(brew --prefix)/bin/virtualenvwrapper.sh
export HADOOP_CONF_DIR=~/Developer/starscream/.cache/spark/current/conf/conf.cloudera.yarn
export HADOOP_USER_NAME="damienrobertson"
export PATH="/usr/local/sbin:$PATH"
export NO_AUTOAUTOLINT=true

# Shopify core and React stuff
export VAGRANT_CWD=~/Developer/vagrant
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Make fzf use the silver searcher instead of find
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# HISTORY
HISTSIZE=65536
SAVEHIST=65536

alias clear=" clear"
alias pwd=" pwd"

# Python VirtualEnv
#alias v='workon'
#alias v.deactivate='deactivate'
#alias v.mk='mkvirtualenv --no-site-packages'
#alias v.mk_withsitepackages='mkvirtualenv'
#alias v.rm='rmvirtualenv'
#alias v.switch='workon'
#alias v.add2virtualenv='add2virtualenv'
#alias v.cdsitepackages='cdsitepackages'
#alias v.cd='cdvirtualenv'
#alias v.lssitepackages='lssitepackages'
