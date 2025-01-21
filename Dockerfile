FROM debian

RUN apt-get update && \
  apt-get install -y gpg curl wget git ninja-build gettext cmake unzip build-essential ripgrep fzf bat neofetch dirmngr gawk golang-go fd-find openssh-server 

# Install githubcli
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
  chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list && \
  apt-get update && apt-get install -y gh

# Install Shell
RUN apt-get install -y zsh && \
  curl https://sh.rustup.rs -sSf | sh -s -- -y && \
  chsh -s /usr/bin/zsh && \
  $HOME/.cargo/bin/cargo install eza starship -q && \
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.local/share/zsh-syntax-highlighting

# Install Neovim
RUN git clone https://github.com/neovim/neovim.git $HOME/.neovim && \
cd $HOME/.neovim && \
git checkout v0.10.1 && \
make CMAKE_BUILD_TYPE=Release && \
make install && \
/usr/bin/zsh -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"

# asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# asdf install nodejs
RUN /bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add nodejs && \
asdf install nodejs 22.13.0 && \
asdf global nodejs 22.13.0'

# asdf install java
RUN /bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add java && \
asdf install java liberica-21.0.5+12 && \
asdf global java liberica-21.0.5+12'

RUN apt-get update && apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# asdf install python
RUN /bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add python && \
asdf install python 3.13.1 && \
asdf global python 3.13.1'

RUN service ssh start && \
echo 'Port 2222 \n \
PermitRootLogin yes' >> /etc/ssh/sshd_config
EXPOSE 2222

# Settings
COPY ./.config/lvim /root/.config/lvim
COPY ./.zshenv /root
COPY ./.zshrc /root 
COPY ./.gitconfig /root

WORKDIR /root
