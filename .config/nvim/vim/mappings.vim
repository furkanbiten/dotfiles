"-----------------------
" Vim specific commands
"-----------------------
let mapleader=","
let maplocalleader=","
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim native mapping for frequently used mappings  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> <ESC>
"map jj <ESC>
inoremap <C-k> <C-o>d$
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>qa :qall<CR>
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>
" Move to the next buffer
nmap <Tab> :bnext<CR>
" Move to the previous buffer
nmap <s-Tab> :bprevious<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab, however be warned it will close without saving anything!
noremap <leader>qb :bp <BAR> bd! #<CR>
" Show all open buffers and their status
nmap <leader>l :ls<CR>
" Moving between splits with arrow keys, sorry Vim, I don't deserve you :(
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
" Check this for MacOS: https://apple.stackexchange.com/questions/341993/macos-can-i-disable-f12-ctrl-left-arrow-ctrl-right-arrow sadsa sa dasda
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>

" Terminal Settings
if has("nvim")
    tnoremap <silent> <Esc> <C-\><C-n>`.$
    tnoremap <A-Left> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-Right> <C-\><C-n><C-w>l
    autocmd BufEnter term://* startinsert
endif

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

vnoremap il <ESC>^vg_

