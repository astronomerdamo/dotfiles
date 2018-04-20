# Simple bashrc
# Use script/setup to update
#

# Source externals
if [ -d "$HOME/Developer/dotfiles/bash/" ]; then
	bash_filepath="$HOME/Developer/dotfiles/bash/"
else
	bash_filepath="$HOME/developer/dotfiles/bash/"
fi

for bash_file in $(ls ${bash_filepath}); do
	if test "${bash_filepath}${bash_file}"; then
		source "${bash_filepath}${bash_file}"
	else
		echo "BASHRC: WARNING ${bash_file} NOT FOUND"
	fi
done

# Unlimited bash history
export HISTSIZE=-1
export HISTFILE=~/.bash_history
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoreboth

# Disregard following commands from history
export HISTIGNORE="exit:clear:history:ls:la:ll"

# Append history when shell exists
shopt -s histappend

# Dev setup
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Source FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Source base 16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# GitHub Personal Token
