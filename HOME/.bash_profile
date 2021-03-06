# Make vim the default editor
export EDITOR="vim"

# Set path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
# Set path for Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Highlight section titles in manual pages
export LESS_TERMCAP_md=$'\e[0;33m'

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Setup for FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --smart-case --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--color light'

# Source bashrc
[ -f ~/.bashrc ] && source ~/.bashrc

