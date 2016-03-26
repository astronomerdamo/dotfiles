# Orion theme for oh-my-zsh
# Damien Robertson

RESET=$reset_color

if [ "$USER" = "Damo" ]; then
    local RET_STATUS="%(?:%{$fg[green]%}λ:%{$fg[red]%}Λ%s)";
else
    RET_STATUS="%{$fg[red]%}!!";
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$RESET%})"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$RESET%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$RESET%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$RESET%}"

# Final Prompt
PROMPT='%{$fg[blue]%}%2~%{$RESET%} $(git_prompt_info)
%D{%H:%M} ${RET_STATUS}%{$RESET%} '
RPS1="${return_code}"
