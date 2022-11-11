#!/bin/bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
export NVM_DIR=$HOME/.nvm;
. $NVM_DIR/nvm.sh;
nvm install node;


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
cargo install ripgrep

wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
tar xf nvim-linux64.tar.gz
echo "alias nvim="~/nvim-linux64/bin/nvim"" >> ~/.bashrc

git clone https://github.com/furkanbiten/dotfiles
cp -r dotfiles/.config/nvim ~/.config/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

