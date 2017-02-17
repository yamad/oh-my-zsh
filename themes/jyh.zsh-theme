# jyh theme
# adjusted from mh theme
# preview: http://cl.ly/1y2x0W0E3t2C0F29043z

# features:
# path is autoshortened to ~30 characters
# displays git status (if applicable in current folder)
# turns username green if superuser, otherwise it is white

# if superuser make the username green
if [ $UID -eq 0 ]; then
    NCOLOR="green";
else
    NCOLOR="white";
fi

# prompt
USERPR='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}'
PATHPR='%{$fg[red]%}%30<...<%~%<<%{$reset_color%}'
SYMBOLPR='%{$fg[gray]%}%(!.#.$)%{$reset_color%}'

if [ $IN_NIX_SHELL -eq 1 ]; then
    NIXPR='%{$fg[green]%}%B|nix%b%{$reset_color%}'
else
    NIXPR=''
fi
PROMPT=${USERPR}${NIXPR}" "${PATHPR}" "${SYMBOLPR}" "

GITINFO='$(git_prompt_info)'
RPROMPT=${GITINFO}

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[gray]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
