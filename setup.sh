#!/bin/bash

# Install system dependencies needed by mason.nvim and other tools
if [[ "$(uname)" == "Darwin" ]]; then
    brew install unzip python3
else
    sudo apt-get install -y unzip python3-pip python3-venv
fi

vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

cwd=$(pwd)
cd 
if ! command -v node &> /dev/null
then
    NVM_LATEST=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_LATEST}/install.sh" | bash
    export NVM_DIR=$HOME/.nvm;
    . $NVM_DIR/nvm.sh;
    nvm install node;
else
    echo "Skipping node installation"
fi

if ! command -v cargo &> /dev/null
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    . "$HOME/.cargo/env"
else
    echo "Skipping cargo installation"
fi

if ! command -v rg &> /dev/null
then
    cargo install ripgrep
else
    echo "Skipping ripgrep installation"
fi

if ! command -v lua &> /dev/null
then
    LUA_LATEST=$(curl -s https://www.lua.org/ftp/ | grep -oP 'lua-\d+\.\d+\.\d+' | sort -V | tail -1)
    curl -R -O "http://www.lua.org/ftp/${LUA_LATEST}.tar.gz"
    tar zxf "${LUA_LATEST}.tar.gz"
    rm "${LUA_LATEST}.tar.gz"
    cd "$LUA_LATEST"
    make all test
    echo "alias lua=\"~/${LUA_LATEST}/src/lua\"" >> ~/.bashrc
    cd
else
    echo "Skipping lua installation"
fi

if ! command -v luarocks &> /dev/null
then
    LUAROCKS_LATEST=$(curl -s https://api.github.com/repos/luarocks/luarocks/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
    curl -R -O "https://luarocks.org/releases/luarocks-${LUAROCKS_LATEST}.tar.gz"
    tar zxf "luarocks-${LUAROCKS_LATEST}.tar.gz"
    rm "luarocks-${LUAROCKS_LATEST}.tar.gz"
    cd "luarocks-${LUAROCKS_LATEST}"
    ./configure --with-lua-include=/usr/include
    make
    sudo make install
    cd
    rm -rf "luarocks-${LUAROCKS_LATEST}"
else
    echo "Skipping luarocks installation"
fi

cd

# Installing go (into ~/go-sdk to avoid GOPATH conflict with ~/go)
GO_LATEST=$(curl -s https://go.dev/VERSION?m=text | head -1)
wget "https://go.dev/dl/${GO_LATEST}.linux-amd64.tar.gz"
mkdir -p ~/go-sdk
tar zxf "${GO_LATEST}.linux-amd64.tar.gz" -C ~/go-sdk --strip-components=1
rm "${GO_LATEST}.linux-amd64.tar.gz"
export GOROOT=~/go-sdk
export PATH=~/go-sdk/bin:$PATH
echo "export GOROOT=~/go-sdk" >> ~/.bashrc
echo "export PATH=~/go-sdk/bin:\$PATH" >> ~/.bashrc
~/go-sdk/bin/go install github.com/mattn/efm-langserver@latest
echo "alias efm-langserver=\"~/go/bin/efm-langserver\"" >> ~/.bashrc


NVIM_LATEST=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
if command -v nvim &> /dev/null
then
    nvim_ver=$(nvim --version | grep "v[0-9]" | cut -f2 -d"v")
    vercomp "$nvim_ver" "$NVIM_LATEST"
    case $? in
        0) op='=';;
        1) op='>';;
        2) op='<';;
    esac
    if [[ "$op" == '<' ]]
    then
        echo "Upgrading nvim from $nvim_ver to $NVIM_LATEST"
        wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
        tar xf nvim-linux-x86_64.tar.gz
        rm nvim-linux-x86_64.tar.gz
        echo "alias nvim=\"~/nvim-linux-x86_64/bin/nvim\"" >> ~/.bashrc
    else
        echo "Correct nvim version is already installed ($nvim_ver)"
    fi
else
    echo "Installing nvim $NVIM_LATEST"
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
    tar xf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
    echo "alias nvim=\"~/nvim-linux-x86_64/bin/nvim\"" >> ~/.bashrc
fi

cd $cwd
cp -r .config/nvim ~/.config/

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Installing oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Skipping oh-my-zsh installation"
fi

# Installing powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
    echo "Skipping p10k installation"
fi

# Installing lazygit
if ! command -v lazygit &> /dev/null; then
    ~/go-sdk/bin/go install github.com/jesseduffield/lazygit@latest
else
    echo "Skipping lazygit installation"
fi

# getting tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf $HOME/
