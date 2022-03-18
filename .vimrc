"autocmd! VimEnter * call s:fcy_nerdcommenter_map()
"function! s:fcy_nerdcommenter_map()
    "nmap <C-/> <plug>NERDCommenterToggle
    "vmap <C-/> <plug>NERDCommenterToggle gv
"endfunction


call plug#begin()
Plug 'preservim/NERDTree'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'cjrh/vim-conda'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'aluriak/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'sainnhe/gruvbox-material'
Plug 'airblade/vim-gitgutter'
Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

"au VimEnter * ALEToggle
au VimEnter * NERDTree
"au VimEnter * NERDTreeTabsOpen
"autocmd BufEnter * NERDTreeMirror
let NERDTreeMapOpenInTab='<ENTER>'
"autocmd BufNew * execute ":tabmove99"

syntax enable
" Key rebindings
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-t> :tabnew<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <s-Tab> :tabprev<CR>
nnoremap <leader>q :tabclose<CR>
"nmap <C-_> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
"nunmap <C-_>
"noremap <C-_> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
let mapleader=","


"let g:NERDCreateDefaultMappings = 0
"nmap <C-> <plug>NERDCommenterToggle
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
"let g:loaded_youcompleteme = 1
let g:jedi#use_tabs_not_buffers = 1 
"let g:jedi#use_splits_not_buffers = "right" 
"execute 'nnoremap <buffer> '.g:jedi#goto_command.' :call jedi#goto()<CR>zz'
"nnoremap <C-space> :tab sp | set nodiff<CR>
"let g:jedi#completions_enabled = 1 
let g:pymode_rope = 0
"autocmd FileType python setlocal completeopt-=preview
"let g:loaded_youcompleteme = 1

set t_Co=256
set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif

set clipboard=unnamedplus
let g:gruvbox_material_background = 'hard'
let g:airline_theme = 'gruvbox_material'
let g:lightline = {'colorscheme' : 'gruvbox_material', 'gruvbox_material_palette':'mix'}
let g:gruvbox_material_palette = 'mix'
colorscheme gruvbox-material

set encoding=utf-8
set tabstop=4
set softtabstop=4
set expandtab
set number
set relativenumber
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
"set hidden
"set noequalalways
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
"nmap <C-T> :enew<cr>

" Move to the next buffer
"nmap <Tab> :bnext<CR>

" Move to the previous buffer
"nmap <s-Tab> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>l :ls<CR>
