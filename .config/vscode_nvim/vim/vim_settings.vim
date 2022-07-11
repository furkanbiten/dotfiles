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
set foldenable
set foldlevelstart=10
set foldnestmax=10
"nnoremap <space> za
"set foldmethod=indent
set cursorline
"set cursorcolumn

set updatetime=250
"autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

"autocmd BufReadPre *.png silent %!xdg-open "%"
"autocmd BufReadPre *.eps silent %!xdg-open "%"
"autocmd BufReadPre *.jpg silent %!xdg-open "%"
"autocmd BufReadPre *.bmp silent %!xdg-open "%"
"autocmd BufReadPre *.ipynb silent %!xdg-open "%"
"autocmd InsertLeave * silent :w!
"autocmd QuickFixCmdPre * :lua ToggleTroubleAuto()<CR>
"autocmd WinEnter * if &buftype == 'quickfix' | :lua ToggleTroubleAuto() | endif
"autocmd BufWinEnter quickfix silent :lua ToggleTroubleAuto()

