# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# FZF setup
set FZF_DEFAULT_COMMAND "rg --files --no-ignore --hidden --smart-case --glob '!.git/*'"
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
