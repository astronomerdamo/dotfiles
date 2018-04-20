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

# Source base 16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Load Customs
source $ZSH/custom/zsh_aliases
source $ZSH/custom/zsh_functions

# GitHub Personal Token
