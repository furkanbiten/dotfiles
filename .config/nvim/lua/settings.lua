vim.o.completeopt = "menu,menuone,noselect"
vim.o.virtualedit = "onemore"
-- vim.o.guioptions = "atI"
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "utf-8"
-- Sane splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Permanent undo
vim.o.undodir = os.getenv("HOME") .. "/.vimdid"
vim.o.undofile = true
-- Use wide tabs
vim.o.shiftwidth = 0
vim.o.softtabstop = -1
vim.o.tabstop = 4
vim.o.expandtab = true

-- Decent wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"
vim.o.wildignore =
	".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite"

-- Proper search
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true

-- Show problematic characters.
vim.o.list = true

-- Stabilize the cursor position when creating/deleting horizontal splits
vim.o.splitkeep = "topline"

-- put numbers and colors
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.lazyredraw = true

-- No swap please
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.cmd([[
syntax enable
filetype on
filetype detect
filetype indent on
" set foldmethod=syntax
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
" set foldnestmax=3
" set foldminlines=1
" set foldlevel=10
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set fillchars=fold:\ 
set foldlevel=99

set updatetime=250
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

]])
