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
sudo apt-get install ninja-build gettext cmake unzip build-essential ripgrep fzf bat neofetch dirmngr curl gawk gh golang-go fd-find -y > /dev/null

# Install asdf
echo -n "Installing asdf.."
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1 > /dev/null
  # echo . '"$HOME/.asdf/asdf.sh"' >> ~/.zshenv
  . "$HOME/.asdf/asdf.sh"
  echo "Done"
else
  echo "Skipping"
fi

# Install nodejs
ASDF_DIR="$HOME/.asdf"
echo -n "Installing nodejs via asdf.."
if [ ! $(which node) ]; then
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git > /dev/null
  asdf install nodejs latest > /dev/null
  asdf global nodejs latest > /dev/null
  echo "Done"
else
  echo "Skipping"
fi

# Install cargo
echo -n "Installing cargo.."
if [ ! -d "$HOME/.cargo" ]; then
  curl https://sh.rustup.rs -sSf | sh
  # echo PATH='"$HOME/.cargo/bin/:$PATH"' >> .zshenv
  echo "Done"
else
  echo "Skipping"
fi

# Install eza
echo -n "Installing eza.."
if [ ! $(which eza) ]; then
  cargo install eza -q
  echo "Done"
else
  echo "Skipping"
fi

# Install ohmyzsh
echo -n "Installing ohmyzsh.."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "Done"
else
  echo "Skipping"
fi

# Install zsh-autosuggestions and zsh-syntax-highlighting
echo -n "Installing zsh-autosuggestions.."
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "Done"
  else
    echo "Skipping"
fi

echo -n "Installing zsh-syntax-highlighting.."
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "Done"
else
  echo "Skipping"
fi

# Install neovim from git
echo -n "Installing neovim.."
if [ ! $(which nvim) ]; then
  git clone https://github.com/neovim/neovim.git $HOME/.neovim
  cd $HOME/.neovim
  git checkout v0.10.1
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  echo "Done"
else
  echo "Skipping"
fi

# Install lunarvim
echo -n "Installing lunarvim.."
if [ ! $(which lvim) ]; then
  zsh -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"
  echo "Done"
else
  echo "Skipping"
fi

# echo 'fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src' >> .zshenv

# neofetch
# mkdir -p ~/.config/neofetch
# echo '
#
#
#
#   ⠀⠀⠀⢀⡴⠖⠒⠶⢤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀
#   ⠀⠀⣰⠏⠀⠀⠀⠀⠈⠉⠉⠉⠉⠙⠛⠶⣄⠀⠀
#   ⠀⢰⣏⡀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⢹⣦⣄
#   ⢀⣿⣿⣿⣦⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡿⠟
#   ⠀⣿⣿⣿⣿⣯⣷⠀⠀⠀⠀⠀⠀⣀⣤⠶⠋⠀⠀
#   ⠀⠈⠻⣿⣿⣿⡿⣄⠀⢸⣟⣟⣿⠉⠀⠀⠀⠀⠀
#   ⠀⠀⠀⠈⠉⠁⠀⠈⡷⠾⣯⠈⠻⡄⠀⠀⠀⠀⠀
#   ⠀⠀⠀⠀⠀⠀⠀⠀⡧⣜⣧⣤⣰⡇⠀⠀⠀⠀⠀
#   ⠀⠀⠀⠀⠀⠀⠀⣸⠇⢹⡟⢻⣿⣷⡄⠀⠀⠀⠀
#   ⠀⠀⠀⠀⠀⠀⠀⣿⣿⣾⣳⡄⠀⠸⣿⠀⠀⠀⠀
#   ⠀⠀⠀⠀⠀⣀⣀⣿⠈⠉⠉⠁⠀⠀⣿⠀⠀⠀⠀
#   ⠀⠀⠀⠀⠀⣻⣿⡟⠛⠛⠛⠛⠋⠉⠉⠀⠀⠀⠀
#
# ' > ~/.config/neofetch/snoopy.ascii

# zshrc
# echo '
# alias la="eza --icons --group-directories-first -lAh"
# alias l="eza --icons --group-directories-first -lh"
# alias ll="eza --icons --group-directories-first -lh"
# alias ls="eza --icons --group-directories-first"
#
# alias cat="batcat"
# alias vi="nvim"
# alias python="python3"
#
# export GOPATH="$HOME/.go"
# export EDITOR="nvim"
# export GPG_TTY=$(tty)
#
# neofetch --ascii ~/.config/neofetch/snoopy.ascii
# ' >> .zshrc
#
git config --global user.email "dev@parkjb.com"
git config --global user.name "parkjbdev"

cp ./.zshrc $HOME/.zshrc
cp ./.zshenv $HOME/.zshenv


echo ""
echo "========================================"
echo ""
echo "Done! Please restart your terminal."
echo ""
echo "========================================"
echo ""

