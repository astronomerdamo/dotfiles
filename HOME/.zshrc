# Path to your oh-my-zsh installation.
export ZSH=/Users/Damo/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="orion"

# oh-my-zsh plugins.
plugins=(gitfast brew)

# Set EDITOR
export EDITOR='vim'

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Spark setup (conflicts with starscream)
export PYSPARK_PYTHON=python3
export PYSPARK_DRIVER_PYTHON=ipython

# Python
export WORKON_HOME=$HOME/.virtualenvs
source $(brew --prefix)/bin/virtualenvwrapper.sh

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set history size (placed here so ohmyzsh doesn't override)
HISTSIZE=65536
SAVEHIST=65536

# Setup for FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom Aliases
alias brfull='bubu && brew doctor'
alias clear=" clear"
alias pwd=" pwd"
alias exit=" exit"

# GitHub Personal Token
