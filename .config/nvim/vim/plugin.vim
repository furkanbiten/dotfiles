call plug#begin()
"""""""""""""""""""""""""""""""""""""
"  Language Server Protocol(LSP) related stuff  "
"""""""""""""""""""""""""""""""""""""
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'mfussenegger/nvim-lint'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jayp0521/mason-null-ls.nvim'
"""""""""""""""
"  Debuggers  "
"""""""""""""""
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/cmp-dap'
"""""""""""""""""""""""
"  Optimization plugins  "
"""""""""""""""""""""""
Plug 'lewis6991/impatient.nvim'
Plug 'nathom/filetype.nvim'
Plug 'luukvbaal/stabilize.nvim'
"""""""""""""""
"  Cosmetics  "
"""""""""""""""
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
"""""""""""""
"  Utility "
"""""""""""""
Plug 'pechorin/any-jump.vim'
Plug 'olimorris/persisted.nvim'
" Plug 'Pocco81/auto-save.nvim'
Plug 'furkanbiten/auto-save.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive' " Run git commands 
Plug 'tpope/vim-surround' " Surrond any text objects with (), [], {}, <>, ...
Plug 'junegunn/gv.vim', {'on': 'GV'} " Check git diffs, blames
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'} " Visual control over undo 
Plug 'wellle/targets.vim'
Plug 'windwp/nvim-autopairs'
Plug 'jpalardy/vim-slime'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'mzlogin/vim-markdown-toc'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'simeji/winresizer'
Plug 'ggandor/lightspeed.nvim',
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'stevearc/aerial.nvim'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'rhysd/conflict-marker.vim'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'stevearc/dressing.nvim'
Plug 'kevinhwang91/nvim-bqf'
" Plug 'rcarriga/nvim-notify'
" Plug 'tommcdo/vim-exchange'
" Plug 'nvim-pack/nvim-spectre'
" Plug 'akinsho/git-conflict.nvim', {'tag':'v1.0.0'}
" Plug 'akinsho/toggleterm.nvim'
" Plug 'voldikss/vim-floaterm'
" Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
""""""""""""""""""""""""""""
"  Scheme related plugins  "
""""""""""""""""""""""""""""
" can be commented with no worries.
"Plug 'guns/vim-sexp', {'for': [ 'clojure', 'fennel', 'commonlisp', 'query', 'scheme']}
"Plug 'Olical/conjure', {'for': [ 'clojure', 'fennel', 'commonlisp', 'query', 'scheme']}
"Plug 'p00f/nvim-ts-rainbow', {'for': [ 'clojure', 'fennel', 'commonlisp', 'query', 'scheme' ]}
"Plug 'tpope/vim-sexp-mappings-for-regular-people'
"Plug 'junegunn/rainbow_parentheses.vim'
""""""""""""
"  Themes  "
""""""""""""
Plug 'rebelot/kanagawa.nvim'
" Plug 'kjssad/quantum.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'navarasu/onedark.nvim'
" Plug 'tanvirtin/monokai.nvim'
"Plug 'iandwelker/rose-pine-vim'
"Plug 'EdenEast/nightfox.nvim' " Vim-Plug
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Plug 'marko-cerovac/material.nvim'
"Plug 'colepeters/spacemacs-theme.vim'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'sainnhe/gruvbox-material'
"Plug 'dracula/vim'
" Plug 'projekt0n/github-nvim-theme'
call plug#end()
