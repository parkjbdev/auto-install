source $HOME/.asdf/asdf.sh

export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"
source $HOME/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=${ASDF_DIR}/completions
fpath+=$HOME/.zfunc
autoload -Uz compinit
compinit

alias la="eza --icons --group-directories-first -lAh" 
alias l="eza --icons --group-directories-first -lh" 
alias ll="eza --icons --group-directories-first -lh" 
alias ls="eza --icons --group-directories-first" 
alias cat="batcat" 
alias vi="nvim" 
alias fd="fdfind"

export EDITOR="lvim" 
export GPG_TTY=$(tty)

