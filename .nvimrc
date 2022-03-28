call plug#begin()
"Plug 'preservim/NERDTree'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'cjrh/vim-conda'
"Plug 'vim-airline/vim-airline'
"Plug 'ap/vim-buftabline'
Plug 'aluriak/nerdcommenter'
Plug 'sainnhe/gruvbox-material'
"Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'vim-scripts/AutoClose'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'Yggdroot/indentLine'
Plug 'brooth/far.vim'
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
"Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'
"We are now going full nvim
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'neovim/nvim-lspconfig'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'
Plug 'rebelot/kanagawa.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-syntastic/syntastic'
"Plug 'nvim-lua/popup.nvim'
call plug#end()



set completeopt=menu,menuone,noselect

au User NvimGdbQuery GdbLopenBacktrace
"au User NvimGdbQuery GdbCreateWatch locals()
"au User NvimGdbQuery call nvim_buf_set_lines(5, 0, -1, 0, split(GdbCustomCommand("locals()"), "\n"))
"au  User NvimGdbQuery echo GdbCustomCommand('locals()')
let g:python3_host_prog = $CONDA_PREFIX.'/bin/python'
"let g:conda_startup_msg_suppress = 1
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger=">>"
let g:UltiSnipsJumpForwardTrigger=">"
let g:UltiSnipsJumpBackwardTrigger="<"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"------------------------------------------------------------------------------
" Vim specific commands
"------------------------------------------------------------------------------
let mapleader=","
"set signcolumn=number

" set the font
"set guifont=Lucida_Console:h9:cDEFAULT

" visual selection copied to clipboard
set guioptions=at
" enable modelines
set modeline
set modelines=5

syntax enable
filetype on
filetype detect
"set filename-display absolute
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
"set foldenable
"set foldlevelstart=10
"set foldnestmax=10
"nnoremap <space> za
"set foldmethod=indent

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
let g:ycm_auto_trigger = 0
"noremap <C-q> :YcmCompleter GetDoc<CR>
"noremap <C-q> <plug>(YCMHover)
"autocmd FileType python let b:ycm_hover = {
      "\ 'command': 'GetDoc',
      "\ 'syntax': 'tex'
      "\ }
""nmap <ESC>[65;5u  <Plug>(YCMFindSymbolInWorkspace)
"map <leader>fy  <Plug>(YCMFindSymbolInWorkspace)
"let g:ycm_add_preview_to_completeopt = 'popup'
"set completeopt+=popup


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
"colorscheme gruvbox-material
"set t_Co=256
"set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif

colorscheme kanagawa
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
let g:ale_linters = {'python': ['flake8','pylint']}
let g:ale_fix_on_save = 1
"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"let g:lightline#extensions#ale#enabled = 1
nmap <leader>af :ALEFix<CR>
"let g:airline#extensions#ale#enabled = 1
"let g:ale_python_pylint_change_directory=0
"let g:ale_python_flake8_change_directory=0
"let g:ale_python_auto_pipenv = 1
"let g:ale_python_flake8_executable = $CONDA_PREFIX.'/bin/python'
let g:ale_python_pylint_options = "--generated-members=numpy.*,torch.*"
"let g:ale_python_pylint_executable ="/home/abiten/miniconda3/envs/transformers/bin/python"
let g:ale_set_highlights =0
"hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg


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
      command = os.getenv("CONDA_PREFIX")..'/bin/python';
      args = { '-m', 'debugpy.adapter'};
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
        pythonPath =  os.getenv("CONDA_PREFIX")..'/bin/python';
        console = "internalConsole";
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
"nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
"nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
"nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
"nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
"nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
"nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
"nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
"nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
"nmap <F9> :IPythonCellInsertAbove<CR>a
"nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
"imap <F9> <C-o>:IPythonCellInsertAbove<CR>
"imap <F10> <C-o>:IPythonCellInsertBelow<CR>
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

" Terminal Settings
if has("nvim")
    tnoremap <silent> <Esc> <C-\><C-n>`.$
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    autocmd BufEnter term://* startinsert
endif

lua <<EOF

require'nvim-tree'.setup {open_on_setup = true}
require'trouble'.setup{}
require("bufferline").setup{}
--require'lspconfig'.pyright.setup{}
--require'lspconfig'.pyre.setup{}
require('feline').setup()
require('gitsigns').setup{}
--local saga = require 'lspsaga'
--saga.init_lsp_saga()

--require'lspconfig'.pyls.setup{}
-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol: ")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
  -- Setup lspconfig.
  --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['python'].setup {
    --capabilities = capabilities
  --}
-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.onifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig
EOF
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
