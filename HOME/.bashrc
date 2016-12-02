# Simple bashrc
# Use script/setup to update
#

# Source externals
bash_filepath=~/Developer/dotfiles/bash/
for bash_file in $(ls ${bash_filepath}); do
	if test "${bash_filepath}${bash_file}"; then
		source "${bash_filepath}${bash_file}"
	else
		echo "BASHRC: WARNING ${bash_file} NOT FOUND"
	fi
done

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
