-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local leader = ","
map("n", leader .. "<Space>", ":nohlsearch<CR>", { silent = true })

vim.cmd([["-----------------------
" Vim specific commands
"-----------------------
let mapleader=","
let maplocalleader=","
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim native mapping for frequently used mappings  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> <ESC>
inoremap <C-c> <ESC>
"map jj <ESC>
inoremap <C-k> <C-o>d$
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>qa :qall!<CR>
noremap <silent> <leader>qw :q<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab, however be warned it will close without saving anything!
noremap <leader>qq :bp <BAR> bd! #<CR>
" Quit window (,qw)
noremap <leader>qw :q<CR> 
" Move to the next buffer
nmap <Tab> :bnext<CR>
" Move to the previous buffer
nmap <s-Tab> :bprevious<CR>
" Moving between splits with arrow keys, sorry Vim, I don't deserve you :(
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
" Check this for MacOS: https://apple.stackexchange.com/questions/341993/macos-can-i-disable-f12-ctrl-left-arrow-ctrl-right-arrow 
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>

" Terminal Settings
if has("nvim")
    tnoremap <silent> <Esc> <C-\><C-n>`.$
    tnoremap <A-left> <C-\><C-n><C-w>h
    tnoremap <A-down> <C-\><C-n><C-w>j
    tnoremap <A-up> <C-\><C-n><C-w>k
    tnoremap <A-right> <C-\><C-n><C-w>l
    autocmd BufEnter term://* startinsert
endif

nnoremap <A-s> :m .+1<CR>==
nnoremap <A-w> :m .-2<CR>==
inoremap <A-s> <Esc>:m .+1<CR>==gi
inoremap <A-w> <Esc>:m .-2<CR>==gi
vnoremap <A-s> :m '>+1<CR>gv=gv
vnoremap <A-w> :m '<-2<CR>gv=gv

vnoremap <leader>se <ESC>^vg_
nnoremap <leader>se ^vg_
" nnoremap  <silent> <leader><space> :nohlsearch<CR>
nnoremap <leader>) ciw(<c-r>")<esc>
" Delete word forward, counter of C-W in insert  
inoremap <C-q> <C-o>dw
" Rotate split horizontally
nnoremap <leader>rh <C-w>t <C-w>K<CR>
" Rotate split vertically
nnoremap <leader>rv <C-w>t <C-w>L<CR>
" inoremap <C-right> <C-o>e<right>]])
