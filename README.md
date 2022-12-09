
<!-- vim-markdown-toc Marked -->

* [Install vim/nvim](#install-vim/nvim)
* [Configurations](#configurations)
* [Vim Basics](#vim-basics)

<!-- vim-markdown-toc -->
# Install vim/nvim

Apart from telescope, all the plugins works in Vim. The reason I moved to nvim is because of telescope plugin. 
Telescope is simply beautiful. 
Follow the instructions here: https://github.com/neovim/neovim/wiki/Installing-Neovim

## Configurations
Clone this repo and copy everything that is inside the .config/nvim to your home directory:
```bash
git clone https://github.com/furkanbiten/dotfiles.git
cd dotfiles/
cp -r .config/nvim ~/.config/ 
```

Run with the native python not **without any envrionment**: 
```bash
/usr/bin/python3 -m pip install --user --upgrade pynvim
```
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```
```bash

sudo apt install npm clangd ripgrep python3-autopep8 flake8 black isort python3-venv pycodestyle mypy pylint
```
For ubuntu 18.04
sudo apt install npm clang python-autopep8 flake8 isort python3-venv pycodestyle mypy pylint
Might want to check this: https://stackoverflow.com/questions/23393707/how-to-update-npm
Unfortunately, you have to install ripgrep manually, check here: https://github.com/BurntSushi/ripgrep/releases

Launch nvim and run :PlugInstall to install all the plugins.

We have to install Meslo font otherwise everything will look weird: https://github.com/andreberg/Meslo-Font

:LspInstallInfo will open a float window where you can select what to install. 
I prefer pyright over jedi and pylsp simply because of speed. Find pyright in the list and press `i`

follow [here](https://stackoverflow.com/questions/8191459/how-do-i-update-node-js) if there is a problem with pyright

You can always run `:checkhealth` to see if something else is wrong.
# Vim Basics
To be written...
