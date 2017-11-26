# Make vim the default editor
export EDITOR="vim"

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# Larger bash history 2^16
export HISTSIZE=-1
export HISTFILE=~/.bash_history
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoreboth

# Disregard following commands from history
export HISTIGNORE="exit:clear:history:ls:la:ll"

# Highlight section titles in manual pages
export LESS_TERMCAP_md=$'\e[0;33m'

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Setup for FZF
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source bashrc
[ -f ~/.bashrc ] && source ~/.bashrc

