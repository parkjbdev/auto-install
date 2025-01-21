source $HOME/.asdf/asdf.sh

export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"
source $HOME/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=${ASDF_DIR}/completions
autoload -Uz compinit
compinit

alias la="eza --icons --group-directories-first -lAh" 
alias l="eza --icons --group-directories-first -lh" 
alias ll="eza --icons --group-directories-first -lh" 
alias ls="eza --icons --group-directories-first" 
alias cat="batcat" 
alias vi="lvim" 
alias python="python3" 

export EDITOR="lvim" 
export GPG_TTY=$(tty)

# export LANG="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"

if [[ -v DISPLAY ]]; then
 sudo xauth add `xauth list $DISPLAY`
fi