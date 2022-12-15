set completeopt=menu,menuone,noselect
syntax enable
filetype on
filetype detect
filetype indent on
"set filename-display absolute
" visual selection copied to clipboard
set guioptions=at
set clipboard=unnamedplus
set encoding=utf-8
set tabstop=4
set shiftwidth=0   " If 0, then uses value of 'tabstop'
set softtabstop=-1 " If negative, then uses 'shiftwidth' (which can use 'tabstop')
"set softtabstop=4
set expandtab
set number
set relativenumber
"set ruler             " show the cursor position all the time
"set showcmd           "shows the last command entered in the very bottom right
"set cursorline " draws a horizontal highlight (or underline, depending on your colorscheme) on the line your cursor is currently on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set autowrite         " Automatically :write before running commands
set nofoldenable      " I really don't like folding in vim
set nobackup          " don't create backup files
set nowritebackup     " really don't create backup files?
set noswapfile        " for real, don't create backup files
" Hide highlighted terms
set cursorline
"set cursorcolumn
set virtualedit=onemore

" set foldmethod=syntax
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" " set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
" set foldnestmax=3
" set foldminlines=1
" set foldlevel=10
" set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
" set fillchars=fold:\\
set foldlevel=99
set nofoldenable

set updatetime=250
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END


" augroup save_file
"     autocmd!
"     au TextChanged * silent!  call timer_start(20, { tid -> execute('w!')}, {'repeat':-1}) 
" augroup END
