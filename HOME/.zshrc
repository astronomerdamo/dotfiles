# Set name of the theme to load.
ZSH_THEME="orion"

# oh-my-zsh plugins.
plugins=(gitfast)

# Dev setup
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Customs
source $ZSH/custom/zsh_aliases
source $ZSH/custom/zsh_functions

# GitHub Personal Token
