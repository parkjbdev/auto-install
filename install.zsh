# Install GPG
echo "Installing GPG"
sudo apt-get update > /dev/null
sudo apt-get install gpg -y > /dev/null

echo "Installing zsh"
sudo apt-get install zsh -y > /dev/null

# Adding gh key
echo "Adding gh key"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Install Essential Packages
echo "Installing Essential Packages"
sudo apt-get update
sudo apt-get install ninja-build gettext cmake unzip build-essential ripgrep fzf bat neofetch dirmngr curl gawk gh golang-go fd-find -y > /dev/null

# Install asdf
if [ ! -d "$HOME/.asdf" ]; then
  echo -n "Installing asdf.."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1 > /dev/null
  . "$HOME/.asdf/asdf.sh"
  echo "Done"
else
  echo "Skipping asdf.."
fi

# Install nodejs
ASDF_DIR="$HOME/.asdf"
if [ ! $(which node) ]; then
  echo -n "Installing nodejs.."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git > /dev/null
  asdf install nodejs latest > /dev/null
  asdf global nodejs latest > /dev/null
  echo "Done"
else
  echo "Skipping nodejs.."
fi

if [ ! $(which java) ]; then
  echo -n "Installing liberica-21.0.5+12 via asdf.."
  asdf plugin add java
  asdf install java liberica-21.0.5+12 > /dev/null
  asdf global java liberica-21.0.5+12 > /dev/null
  echo "Done"
else
  echo "Skipping liberica-21.0.5+12.."
fi

# Install cargo
if [ ! -d "$HOME/.cargo" ]; then
  echo -n "Installing cargo.."
  curl https://sh.rustup.rs -sSf | sh
  echo "Done"
else
  echo "Skipping cargo.."
fi

# Install eza
if [ ! $(which eza) ]; then
  echo -n "Installing eza.."
  cargo install eza -q
  echo "Done"
else
  echo "Skipping eza.."
fi

# Install ohmyzsh
# echo -n "Installing ohmyzsh.."
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#   cp ./.oh-my-zsh/custom/themes/robbyrussell.zsh-theme $HOME/.oh-my-zsh/custom/themes/
#   echo "Done"
# else
#   echo "Skipping"
# fi

# Install zsh-autosuggestions and zsh-syntax-highlighting
if [ ! -d "$HOME/.local/share/zsh-autosuggestions" ]; then
  echo -n "Installing zsh-autosuggestions.."
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh-autosuggestions
  echo "Done"
  else
    echo "Skipping zsh-autosuggestions.."
fi

if [ ! -d "$HOME/.local/share/zsh-syntax-highlighting" ]; then
  echo -n "Installing zsh-syntax-highlighting.."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.local/share/zsh-syntax-highlighting
  echo "Done"
else
  echo "Skipping zsh-syntax-highlighting.."
fi

# Install neovim from git
if [ ! $(which nvim) ]; then
  echo -n "Installing neovim.."
  git clone https://github.com/neovim/neovim.git $HOME/.neovim
  cd $HOME/.neovim
  git checkout v0.10.3
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  echo "Done"
else
  echo "Skipping neovim.."
fi

# Install lunarvim
if [ ! $(which lvim) ]; then
  echo -n "Installing lunarvim.."
  zsh -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"
  cp ./.config/lvim $HOME/.config/
  echo "Done"
else
  echo "Skipping lunarvim.."
fi

git config --global user.email "dev@parkjb.com"
git config --global user.name "parkjbdev"

echo ""
echo "========================================"
echo ""
echo "Done! Please restart your terminal."
echo ""
echo "========================================"
echo ""



apt-get update
apt-get install -y gpg curl wget git ninja-build gettext cmake unzip build-essential ripgrep fzf bat neofetch dirmngr gawk golang-go fd-find openssh-server tmux

# Install githubcli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list && \
apt-get update && apt-get install -y gh

# Install Shell
apt-get install -y zsh && \
curl https://sh.rustup.rs -sSf | sh -s -- -y && \
chsh -s /usr/bin/zsh && \
$HOME/.cargo/bin/cargo install eza starship -q && \
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh-autosuggestions && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.local/share/zsh-syntax-highlighting

# Install Neovim
git clone https://github.com/neovim/neovim.git $HOME/.neovim && \
cd $HOME/.neovim && \
git checkout v0.10.1 && \
make CMAKE_BUILD_TYPE=Release && \
make install && \
/usr/bin/zsh -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# asdf install nodejs
/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add nodejs && \
asdf install nodejs 22.13.0 && \
asdf global nodejs 22.13.0'

# asdf install python
apt-get update && apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add python && \
asdf install python 3.13.1 && \
asdf global python 3.13.1'

# asdf install java
/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add java && \
asdf install java openjdk-21.0.2'

/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add gradle && \
asdf install gradle 8.12 && \
asdf global gradle 8.12'

/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add java && \
asdf install java openjdk-17.0.2 && \
asdf global java openjdk-17.0.2'

/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add maven && \
asdf install maven latest && \
asdf global maven latest'

/bin/bash -c 'source $HOME/.asdf/asdf.sh && \
asdf plugin add spring-boot && \
asdf install spring-boot latest && \
asdf global spring-boot latest'

cp ./.zshrc $HOME/.zshrc
cp ./.zshenv $HOME/.zshenv
cp -r ./.config/lvim $HOME/.config/lvim
cp ./.gitconfig $HOME/
