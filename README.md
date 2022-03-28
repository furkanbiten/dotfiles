# vim-conf

## Install vim/nvim
Apart from telescope, all the plugins works in Vim. The reason I moved to nvim is because of telescope plugin. 
Telescope is simply beautiful. 
Follow the instructions here: https://github.com/neovim/neovim/wiki/Installing-Neovim

## Configurations
```bash
touch .nvimrc
mkdir -p ~/.config/nvim
echo 'source ~/.nvimrc' > ~/.config/nvim/init.vim
```
Then copy the `.nvim.rc` to your `~` directory.

Run with the native python not **WITH ENVIRONMENT: 
```bash
$ python3 -m pip install --user --upgrade pynvim
```
Launch nvim and run :PlugInstall to install all the libraries.

# Vim Basics


run sudo apt install eslint

inoremap <silent><expr> <TAB>
 20 │     \ pumvisible() ? coc#_select_confirm() :
 21 │     \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
 22 │     \ <SID>check_back_space() ? "\<TAB>" :
 23 │     \ coc#refresh()
 24
 25 function! s:check_back_space() abo
