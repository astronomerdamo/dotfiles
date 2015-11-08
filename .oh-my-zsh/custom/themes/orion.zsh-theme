# Sunrise theme for oh-my-zsh
# Intended to be used with Solarized: http://ethanschoonover.com/solarized
# (Needs Git plugin for current_branch method)

# Color shortcuts
R=$fg_no_bold[red]
O=$FG[166]
G=$fg_no_bold[green]
M=$fg_no_bold[magenta]
Y=$fg_no_bold[yellow]
B=$fg_no_bold[blue]
RESET=$reset_color

if [ "$USER" = "root" ]; then
    # PREFIX="%{$R%}!!%{$RESET%}";
    RET_STATUS="%{$R%}!!%{$RESET%}";
else
    # local PREFIX="%(?:%{$G%}--:%{$R%}--%s)%{$RESET%}";
    local RET_STATUS="%(?:%{$G%}λ:%{$R%}Λ%s)";
    #local CMD_KEY="%(?:%!:%{$R%}%!%s)";
    # PREFIX="%{$B%}--%{$RESET%}";
fi

# local return_code="%(?..%{$R%}%? ↵%{$RESET%})"
# local ret_status="%(?:%{$G%}ᐅ:%{$R%}ᐅ%s)"

# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

# get the name of the branch we are on (copied and modified from git.zsh)
function custom_git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_prompt_ahead)$(custom_git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# %B sets bold text
#PROMPT='%B$PREFIX %2~ $(custom_git_prompt)%{$G%}»%{$RESET%} '

PROMPT='%{$G%}/%{$B%}%c%{$RESET%} $(custom_git_prompt)${RET_STATUS}%{$RESET%} '

#PROMPT='$PREFIX %{$B%}%~%{$RESET%} $(custom_git_prompt)
#${CMD_KEY} ${RET_STATUS}%{$RESET%} '
#PROMPT='%{$B%}%~%{$RESET%} $(custom_git_prompt)
#${CMD_KEY} ${RET_STATUS}%{$RESET%} '
# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$Y%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$Y%}]%{$RESET%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$O%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$B%}➔"


ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$G%}+"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$G%}!"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$G%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$G%}-"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$O%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$O%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$O%}-"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$O%}UU"
