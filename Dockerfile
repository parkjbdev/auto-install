FROM debian

RUN apt-get update && \
  apt-get install -y gpg zsh curl git ninja-build gettext cmake unzip build-essential ripgrep fzf bat neofetch dirmngr gawk gh golang-go fd-find wget && \
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
  chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

RUN $HOME/.cargo/bin/cargo install eza starship -q

RUN git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh-autosuggestions && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.local/share/zsh-syntax-highlighting

RUN git clone https://github.com/neovim/neovim.git $HOME/.neovim && \
cd $HOME/.neovim && \
git checkout v0.10.1 && \
make CMAKE_BUILD_TYPE=Release && \
make install && \
/usr/bin/zsh -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"

RUN chsh -s /usr/bin/zsh && \
git config --global user.email "dev@parkjb.com" && \
git config --global user.name "parkjbdev" && \
echo 'export PATH="$HOME/.local/bin:$PATH" \n \
\n \
source $HOME/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh \n \
source $HOME/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \n \
\n \
eval "$(starship init zsh)" \n \
\n \
alias la="eza --icons --group-directories-first -lAh" \n \
alias l="eza --icons --group-directories-first -lh" \n \
alias ll="eza --icons --group-directories-first -lh" \n \
alias ls="eza --icons --group-directories-first" \n \
alias cat="batcat" \n \
alias vi="lvim" \n \
alias python="python3" \n \
\n \
export EDITOR="lvim" \n \
export GPG_TTY=$(tty)\n' >> $HOME/.zshrc
