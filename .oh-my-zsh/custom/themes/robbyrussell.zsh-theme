# PROMPT="$fg_bold[cyan]%}$USER$fg[white]%}@%{$fg_bold[blue]%}%m"
PROMPT="%(?:%{$fg_bold[green]%}%m:%{$fg_bold[red]%}%m) %{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
