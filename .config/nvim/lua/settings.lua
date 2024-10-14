-- Hide deprecation warnings
vim.g.deprecation_warnings = false
-- TODO: Check the below option of completeopt
vim.o.completeopt = "menu,menuone,noselect"
vim.o.virtualedit = "onemore"
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "utf-8"

vim.opt.termsync = true
-- Sane splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Permanent undo
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
-- Use wide tabs
vim.o.shiftwidth = 0
vim.o.softtabstop = -1
vim.o.tabstop = 4
vim.o.expandtab = true

-- Decent wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"

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
--  Issues with noice plugin
-- vim.o.lazyredraw = true

-- No swap please
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.colorcolumn = "80"
vim.opt.spell = true
