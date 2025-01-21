. "$HOME/.cargo/env"

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/plugins/java/set-java-home.zsh"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin/:$PATH"
PATH="$HOME/.go/bin:$PATH"
PATH="/usr/local/gcc-13.2.0/bin/:$PATH"
LD_LIBRARY_PATH="$HOME/.local/lib:$HOME/linux/include:$LD_LIBRARY_PATH"

export ZSH_COMPDUMP=$HOME/.zcompdump
