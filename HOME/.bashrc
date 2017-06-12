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

# Append history when shell exists
shopt -s histappend

# Dev setup
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Spark setup (conflicts with starscream)
#export PYSPARK_PYTHON=python3
#export PYSPARK_DRIVER_PYTHON=ipython

# Source FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# GitHub Personal Token
