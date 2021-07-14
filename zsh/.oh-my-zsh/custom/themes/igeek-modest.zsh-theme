# igeek zsh-theme

local g_status="%(?:%{$fg_bold[white]%}#➤ :%{$fg_bold[red]%}#➤ )"
# show staged changes in the repository
local g_changes="$FG[038][%c]%{$reset_color%}"
# Define prompts
#
PROMPT='${g_status}${g_changes} $(git_prompt_info)'

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
