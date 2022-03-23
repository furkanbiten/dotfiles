call plug#begin()
Plug 'preservim/NERDTree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'cjrh/vim-conda'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'aluriak/nerdcommenter'
Plug 'sainnhe/gruvbox-material'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'vim-scripts/AutoClose'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'Yggdroot/indentLine'
Plug 'brooth/far.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'puremourning/vimspector'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'dense-analysis/ale'
call plug#end()

"------------------------------------------------------------------------------
" Vim specific commands 
"------------------------------------------------------------------------------
let mapleader=","
syntax enable
"filetype on
"filetype detect
set clipboard=unnamedplus
set encoding=utf-8
set tabstop=4
set softtabstop=4
set expandtab
set number
set relativenumber
set showcmd
set cursorline
"filetype indent on
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

"------------------------------------------------------------------------------
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

"------------------------------------------------------------------------------
" Lightline configuration
"------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
let g:lightline = {'colorscheme' : 'gruvbox_material', 'gruvbox_material_palette':'mix'}
"------------------------------------------------------------------------------
" Telescope keybindings configuration
"------------------------------------------------------------------------------
noremap <C-F> :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>
noremap <leader>fa :Telescope live_grep<CR>
noremap <leader>ff :Telescope find_files<CR>
noremap <leader>fm :Telescope keymaps<CR>

"------------------------------------------------------------------------------
" YouCompleteMe keybindings configuration
"------------------------------------------------------------------------------
noremap <C-g> :YcmCompleter GoTo<CR>
noremap <C-n> :YcmCompleter GoToReferences<CR>
"noremap <C-q> :YcmCompleter GetDoc<CR>
nmap <C-q> <plug>(YCMHover)
autocmd FileType python let b:ycm_hover = {
      \ 'command': 'GetDoc',
      \ 'syntax': 'tex'
      \ }
"nmap <ESC>[65;5u  <Plug>(YCMFindSymbolInWorkspace)
map <leader>fy  <Plug>(YCMFindSymbolInWorkspace)


"------------------------------------------------------------------------------
" Floaterm keybindings configuration
"------------------------------------------------------------------------------
noremap <leader>o :FloatermNew --wintype=split --height=0.3<CR>
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_keymap_kill = '<leader>k'

"------------------------------------------------------------------------------
" Farr keybindings configuration
"------------------------------------------------------------------------------
nnoremap <silent> <leader>r  :Farr<cr>
vnoremap <silent> <leader>r  :Farr<cr>

"------------------------------------------------------------------------------
" TagBar keybindings configuration
"------------------------------------------------------------------------------
nmap <s-t> :TagbarToggle<CR>
"nnoremap t] :call tagbar#jumpToNearbyTag(1)
"nnoremap t[ :call tagbar#jumpToNearbyTag(-1)

"------------------------------------------------------------------------------
" Gruvbox-material colorscheme configuration
"------------------------------------------------------------------------------
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'mix'
colorscheme gruvbox-material
set t_Co=256
set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif

"------------------------------------------------------------------------------
" NERDTree configuration
"------------------------------------------------------------------------------
" Plugin Specific configurations
" To start nerdtree on startup
let g:nerdtree_tabs_open_on_console_startup=1

"------------------------------------------------------------------------------
" NERDCommenter configuration so that we can use toggle comment
"------------------------------------------------------------------------------
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"------------------------------------------------------------------------------
" Ale configuration so that we can lint and see the errors
"------------------------------------------------------------------------------
let g:ale_fixers = {'python': ['yapf'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1 
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"let g:lightline#extensions#ale#enabled = 1
nmap <leader>af :ALEFix<CR>

"let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}

"------------------------------------------------------------------------------
" Some Lua stuff for treesitter and nvim-dap: THE debugger.
"------------------------------------------------------------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    --disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    --the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
lua << EOF
    local dap = require('dap')
    dap.adapters.python = {
      type = 'executable';
      command = '/home/abiten/miniconda3/envs/transformers/bin/python';
      args = { '-m', 'debugpy.adapter' };
      justMyCode=false;
    }
EOF
lua << EOF
    require('dap')
    vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    local dap = require('dap')
    dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        justMyCode=false; 
        args = function()
            local args_string = vim.fn.input('Arguments: ')
            return vim.split(args_string, " +")
        end;
        pythonPath = '/home/abiten/miniconda3/envs/transformers/bin/python';
      },
    }
EOF

nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_out()<CR>
nnoremap <silent> <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
function! Run_dapui()
        lua require'dapui'.setup()
        lua require'dapui'.open()
endfunction
nnoremap <leader>do :<C-u>call Run_dapui()<CR> 
"let g:vimspector_enable_mappings = 'HUMAN'
"nnoremap <leader>si <Plug>VimspectorStepInto<CR>
" for normal mode - the word under the cursor
"nmap <Leader>di <Plug>VimspectorBalloonEval

"------------------------------------------------------------------------------
" Vim-slime configuration
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'
"let g:slime_target = "vimterminal"
let g:slime_paste_file = "$HOME/.slime_paste"
" or maybe...
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
nmap <F9> :IPythonCellInsertAbove<CR>a
nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
imap <F9> <C-o>:IPythonCellInsertAbove<CR>
imap <F10> <C-o>:IPythonCellInsertBelow<CR>
function! IPythonOpen()
    " open a new terminal in vertical split and run IPython
    vnew|call termopen('zsh; conda activate transformers; ipython --matplotlib')
    file ipython " name the new buffer

    " set slime target to new terminal
    if !exists('g:slime_default_config')
        let g:slime_default_config = {}
    end
    let g:slime_default_config['jobid'] = b:terminal_job_id

    wincmd p " switch to the previous buffer
endfunction


