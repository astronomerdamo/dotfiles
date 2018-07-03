# Simple bashrc
# Use script/setup_<os> to update
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

# Highlight section titles in manual pages
export LESS_TERMCAP_md=$'\e[0;33m'

# # Don’t clear the screen after quitting a manual page
export MANPAGER='less -X'

# Source FZF
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

# Setup for FZF
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --smart-case --glob '!.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--color light'

# Source base 16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
