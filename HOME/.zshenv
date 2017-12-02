# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Set EDITOR
export EDITOR='vim'

# Setup for FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --smart-case --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set history size (placed here so ohmyzsh doesn't override)
HISTSIZE=65536
SAVEHIST=65536

