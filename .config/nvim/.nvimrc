call plug#begin()
Plug 'aluriak/nerdcommenter'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
"Plug 'AndrewRadev/sideways.vim'
"Plug 'wellle/context.vim'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
"Plug 'puremourning/vimspector'
Plug 'jpalardy/vim-slime'
"Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
"Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'simeji/winresizer'
Plug 'Olical/conjure'
"Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'p00f/nvim-ts-rainbow'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
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
Plug 'ggandor/lightspeed.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'stevearc/aerial.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
"Plug 'RRethy/vim-illuminate'
Plug 'lewis6991/impatient.nvim'
Plug 'nathom/filetype.nvim'
Plug 'luukvbaal/stabilize.nvim'
"Plug 'karb94/neoscroll.nvim'
"Plug 'dstein64/nvim-scrollview'
Plug 'j-hui/fidget.nvim'
"Themes
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Plug 'marko-cerovac/material.nvim'
"Plug 'colepeters/spacemacs-theme.vim'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'sainnhe/gruvbox-material'
"Plug 'dracula/vim'
Plug 'rebelot/kanagawa.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()

set completeopt=menu,menuone,noselect
"let g:python3_host_prog = $CONDA_PREFIX.'/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

let g:conjure#client#scheme#stdio#command = "scheme"
noremap s <Plug>Lightspeed_omni_s
"------------------------------------------------------------------------------
" Vim specific commands
"------------------------------------------------------------------------------
let mapleader=","
let maplocalleader=","
"exec 'highlight MatchWordCur guibg=#b2ceee'

inoremap <C-k> <C-o>d$
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>qa :qall<CR>

"nnoremap <c-h> :SidewaysLeft<cr>
"nnoremap <c-l> :SidewaysRight<cr>
map <C-c> <ESC>
"map jj <ESC>
nnoremap <leader>u :UndotreeToggle<CR>

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
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>) ciw(<c-r>")<esc>
"set foldenable
"set foldlevelstart=10
"set foldnestmax=10
"nnoremap <space> za
"set foldmethod=indent
"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"autocmd syntax scheme call :RainbowToggle<CR>
"function! s:ActivateRainbowParens() abort
    "RainbowToggle
"endfunction
"augroup rainbow_lisp
  "autocmd!
  "autocmd FileType lisp,clojure,scheme RainbowParenthesesActivate
  "autocmd FileType lisp,clojure,scheme RainbowParenthesesActivate
"augroup END
" Keybindings for using buffers in Vim
"------------------------------------------------------------------------------
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <C-T> :enew<cr>
" Move to the next buffer
nmap <Tab> :bnext<CR>
" Move to the previous buffer
nmap <s-Tab> :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab,
" however be warned it will close without saving anything!
noremap <leader>q :bp <BAR> bd! #<CR>
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

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap il <ESC>^vg_

""""""""""""""""""""""
"  Plug Shortcuts "
""""""""""""""""""""""
nnoremap <silent><leader>pi :PlugInstall<CR>
nnoremap <silent><leader>ps :PlugStatus<CR>
nnoremap <silent><leader>pc :PlugClean<CR>
nnoremap <silent><leader>pu :PlugUpdate<CR>

"------------------------------------------------------------------------------
" Telescope keybindings configuration
"------------------------------------------------------------------------------
noremap <C-F> :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>
noremap <leader>fa :Telescope live_grep<CR>
noremap <leader>ff :Telescope find_files<CR>
noremap <leader>fm :Telescope keymaps<CR>

""""""""""""""""""""""""
"  Bufferlines Keymap  "
""""""""""""""""""""""""
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>bn :BufferLineMoveNext<CR>
nnoremap <silent><leader>bp :BufferLineMovePrev<CR>
nnoremap <silent><Tab> :BufferLineCycleNext<CR>
nnoremap <silent><s-Tab> :BufferLineCyclePrev<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

"------------------------------------------------------------------------------
" Floaterm keybindings configuration
"------------------------------------------------------------------------------
noremap <leader>o :FloatermNew --wintype=split --height=0.3<CR>
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_keymap_kill = '<leader>k'


"------------------------------------------------------------------------------
" Gruvbox-material colorscheme configuration
"------------------------------------------------------------------------------
set t_Co=256
" Important!!
if has('termguicolors')
    set termguicolors
endif
"colorscheme kanagawa
colorscheme nightfly
"colorscheme material
"let g:material_style = "deep ocean"
"let g:material_style = "darker"
"------------------------------------------------------------------------------
" NERDCommenter configuration so that we can use toggle comment
"------------------------------------------------------------------------------
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"------------------------------------------------------------------------------
" Some Lua stuff for treesitter and nvim-dap: THE debugger.
"------------------------------------------------------------------------------
lua require('dap_config')
lua require('treesitter')
lua require('lsp')
lua require('cosmetics')
"au  InsertLeave * lua require('lint').try_lint()
au  BufWritePre * lua require('lint').try_lint()
au  TextChanged * lua require('lint').try_lint()
au FileType dap-repl lua require('dap.ext.autocompl').attach()
nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_out()<CR>
nnoremap <silent> <F5> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
nnoremap <leader>do :lua require'dapui'.open()<CR>
nnoremap <leader>dc :lua require'dapui'.close()<CR>
nnoremap <leader>dt :lua require'dapui'.toggle()<CR>
"let g:vimspector_enable_mappings = 'HUMAN'
"let g:vimspector_base_dir=expand( '$HOME/.local/share/nvim/plugged/vimspector/configurations/.vimspector.json' )
"nnoremap <leader>si <Plug>VimspectorStepInto<CR>
" for normal mode - the word under the cursor
"nmap <Leader>di <Plug>VimspectorBalloonEval
"au BufDelete * lua require('lsp').DetachBufferFromClients(tonumber(vim.fn.expand("<abuf>")))
"autocmd BufDelete * lua require('lsp').DetachBufferFromClients(bufnr)))
"au BufDelete <buffer> * lua vim.lsp.stop_client(vim.lsp.buf_get_clients())
"------------------------------------------------------------------------------
" Vim-slime configuration
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'
"let g:slime_target = "neovim"
"let g:slime_paste_file = "$HOME/.slime_paste"
" or maybe...
"let g:slime_paste_file = tempname()
"let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
                        \ 'socket_name': get(split($TMUX, ','), 0),
                        \ 'target_pane': '{top-right}' }
"let g:slime_dont_ask_default = 1

xmap <c-x><c-x> <Plug>SlimeRegionSend
nmap <c-x><c-x> <Plug>SlimeParagraphSend
nmap <c-x>v     <Plug>SlimeConfig
" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend
" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>
"nmap <c-c>o    call SlimeOverrideConfig()
"function SlimeOverrideConfig()
  "let b:slime_config = {}
  "let b:slime_config["slime_target"] = input("slime_target: ", "neovim")
"endfunction
"""""""""""""""""""""""
"  Ultisnips keymaps  "
"""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"


let g:context_nvim_no_redraw = 1
au User NvimGdbQuery GdbLopenBacktrace
"au User NvimGdbQuery GdbCreateWatch locals()
"au User NvimGdbQuery call nvim_buf_set_lines(5, 0, -1, 0, split(GdbCustomCommand("locals()"), "\n"))
"au  User NvimGdbQuery echo GdbCustomCommand('locals()')
let g:gitgutter_sign_added = '▋'
let g:gitgutter_sign_modified = '▐'
let g:gitgutter_sign_removed = '▋'
let g:gitgutter_sign_removed_first_line = '▋'
let g:gitgutter_sign_modified_removed = '▐_'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
autocmd BufReadPre *.png silent %!xdg-open "%"
autocmd BufReadPre *.eps silent %!xdg-open "%"
autocmd BufReadPre *.jpg silent %!xdg-open "%"
autocmd BufReadPre *.bmp silent %!xdg-open "%"
autocmd BufReadPre *.ipynb silent %!xdg-open "%"

set updatetime=250
"autocmd CursorHold * lua require('echo-diagnostics').echo_line_diagnostic()
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  BELOW THIS POINT IS THE GRAVEYARD! (TREAD CAREFULLY!)  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
 "map <Leader>r to run script
"nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
"nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
"nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
"nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
"nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
"nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
"nnoremap [c :IPythonCellPrevCell<CR>
"nnoremap ]c :IPythonCellNextCell<CR>


" map <Leader>p to run the previous command
"nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
"nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>q to exit debug mode or IPython
"nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
"nmap <F9> :IPythonCellInsertAbove<CR>a
"nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
"imap <F9> <C-o>:IPythonCellInsertAbove<CR>
"imap <F10> <C-o>:IPythonCellInsertBelow<CR>
"function! IPythonOpen()
        "" open a new terminal in vertical split and run IPython
        "vnew|call termopen('zsh; conda activate transformers; ipython --matplotlib')
        "file ipython " name the new buffer

        "" set slime target to new terminal
        "if !exists('g:slime_default_config')
                "let g:slime_default_config = {}
        "end
        "let g:slime_default_config['jobid'] = b:terminal_job_id

        "wincmd p " switch to the previous buffer
"endfunction


"------------------------------------------------------------------------------
" Ale configuration so that we can lint and see the errors
"------------------------------------------------------------------------------
"let g:ale_fixers = {'python': ['autopep8', 'isort'], 'lua': ['lua-format'], '*': ['remove_trailing_lines', 'trim_whitespace']}
"let g:ale_linters = {'python': [], 'lua': []}
""let g:ale_linters = {'python': ['bandit', 'flake8', 'flakehell', 'jedils', 'mypy', 'prospector', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylama', 'pylint', 'pylsp', 'pyre', 'pyright', 'unimport', 'vulture']}
"let g:ale_fix_on_save = 1
"let g:ale_disable_lsp=1
"let g:ale_sign_error = 'E'
"let g:ale_sign_warning = 'W'
"nmap <leader>af :ALEFix<CR>
"nnoremap ]r :ALENextWrap<CR>
"nnoremap [r :ALEPreviousWrap<CR>
"nnoremap ]rd :ALEDetail<CR>
"let g:ale_lua_stylua_executable="/Users/abiten/.cargo/bin/stylua"
""let g:ale_python_pyre_executable = $CONDA_PREFIX.'/bin/python'
""let g:ale_python_pylint_options = " --generated-members=numpy.* ,torch.* ,cv2.* , cv.*"
"let g:ale_set_highlights =0

"------------------------------------------------------------------------------
" Farr keybindings configuration
"------------------------------------------------------------------------------
"nnoremap <silent> <leader>r  :Farr<cr>
"vnoremap <silent> <leader>r  :Farr<cr>
