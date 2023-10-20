curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \

sudo apt update
sudo apt install ripgrep fzf bat neofetch dirmngr gpg curl gawk gh golang-go fd-find eza -y

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo . '"$HOME/.asdf/asdf.sh"' >> .zshenv
. "$HOME/.asdf/asdf.sh"

# install nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# install cargo
curl https://sh.rustup.rs -sSf | sh
echo PATH='"$HOME/.cargo/bin/:$PATH"' >> .zshenv

# install ohmyzsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install nvim version manager bob & nvim
cargo install bob-nvim
mkdir -p ~/.oh-my-zsh/completions
bob complete zsh > ~/.oh-my-zsh/completions/_bob
bob install latest
bob use latest
echo PATH='"$HOME/.local/share/bob/nvim-bin:$PATH"' >> .zshenv
echo 'fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src' >> .zshenv

# install logo-ls
export GOPATH="$HOME/.go"
git clone https://github.com/canta2899/logo-ls.git
cd logo-ls
go install .
mkdir -p /usr/local/share/man/man1
sudo mv logo-ls.1.gz /usr/local/share/man/man1
cd ..
rm -rf logo-ls
export PATH="$HOME/.go/bin:$PATH" >> .zshenv

# neofetch
mkdir -p ~/.config/neofetch
echo '



  ⠀⠀⠀⢀⡴⠖⠒⠶⢤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⣰⠏⠀⠀⠀⠀⠈⠉⠉⠉⠉⠙⠛⠶⣄⠀⠀
  ⠀⢰⣏⡀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⢹⣦⣄
  ⢀⣿⣿⣿⣦⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡿⠟
  ⠀⣿⣿⣿⣿⣯⣷⠀⠀⠀⠀⠀⠀⣀⣤⠶⠋⠀⠀
  ⠀⠈⠻⣿⣿⣿⡿⣄⠀⢸⣟⣟⣿⠉⠀⠀⠀⠀⠀
  ⠀⠀⠀⠈⠉⠁⠀⠈⡷⠾⣯⠈⠻⡄⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⡧⣜⣧⣤⣰⡇⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⣸⠇⢹⡟⢻⣿⣷⡄⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⣿⣿⣾⣳⡄⠀⠸⣿⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣀⣀⣿⠈⠉⠉⠁⠀⠀⣿⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⣻⣿⡟⠛⠛⠛⠛⠋⠉⠉⠀⠀⠀⠀

' > ~/.config/neofetch/snoopy.ascii

# zshrc
echo '
alias cat="batcat"
alias vi="nvim"
alias python="python3"

export GOPATH="$HOME/.go"
export EDITOR="nvim"
export GPG_TTY=$(tty)

neofetch --ascii ~/.config/neofetch/snoopy.ascii
' >> .zshrc

git config --global user.email "dev@parkjb.com"
git config --global user.name "parkjbdev"

echo ""
echo "========================================"
echo ""
echo "Add zsh-autosuggestions and zsh-syntax-highlighting to plugins in .zshrc"
echo "Done! Please restart your terminal."
echo ""
echo "========================================"
echo ""
