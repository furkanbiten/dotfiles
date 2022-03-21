call plug#begin()
Plug 'preservim/NERDTree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'cjrh/vim-conda'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
"Plug 'bling/vim-bufferline'
"Plug 'sainnhe/everforest'
"Plug 'inducer/pudb'
"Plug 'davidhalter/jedi-vim'
Plug 'aluriak/nerdcommenter'
"Plug 'dense-analysis/ale'
Plug 'sainnhe/gruvbox-material'
Plug 'airblade/vim-gitgutter'
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'townk/vim-autoclose'
"Plug 'ervandew/supertab'
"Plug 'kien/ctrlp.vim'
"Plug 'mileszs/ack.vim'
Plug 'preservim/tagbar'
Plug 'vim-scripts/AutoClose'
"Plug 'valloric/youcompleteme'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
"Plug 'liuchengxu/vim-clap'
Plug 'Yggdroot/indentLine'
Plug 'brooth/far.vim'
Plug 'voldikss/vim-floaterm'
"Plug 'puremourning/vimspector'
"Plug 'raphamorim/lucario'
"Plug 'mhinz/vim-grepper'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

let mapleader=","
"noremap <leader>
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

noremap <C-F> :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>
noremap <leader>fa :Telescope live_grep<CR>
noremap <leader>ff :Telescope find_files<CR>
noremap <leader>fm :Telescope keymaps<CR>
"noremap <C-F> :Clap blines<CR>
"noremap <leader>fa :Clap grep<CR> 
"noremap <leader>ff :Clap files<CR>
"noremap <leader>fm :Clap maps<CR>
"let g:vimspector_enable_mappings = 'HUMAN'
"nmap <leader>c <Plug>VimspectorContinue
"nmap <leader>b <Plug>VimspectorToggleBreakpoint
"nmap <leader>R <Plug>VimpectorRestart

" Configuration example
"let g:floaterm_keymap_new    = '<F5>'
"let g:floaterm_keymap_prev   = '<F8>'
"let g:floaterm_keymap_next   = '<F9>'
noremap <leader>o :FloatermNew --wintype=split --height=0.3<CR>
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_keymap_kill = '<leader>k'
"nnoremap   <silent>   <F7>    :FloatermNew<CR>
"tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
"nnoremap   <silent>   <F8>    :FloatermPrev<CR>
"tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
"nnoremap   <silent>   <F9>    :FloatermNext<CR>
"tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
"nnoremap   <silent>   <F12>   :FloatermToggle<CR>
"tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>


"let g:Lf_ShortcutF = "<leader>ff"

"let g:Lf_CommandMap = {'j':['<Down>'], '<k>': ['<Up>'],'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"noremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
"noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" Search in all projects with Control+Shift+F like PyCharm 
"Have to map this escape character in terminal (iterm2 or gnome)
"noremap <leader>fa :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
"noremap go :<C-U>Leaderf! rg --recall<CR>
"let g:Lf_GtagsSource = 1
"let g:Lf_GtagsAutoGenerate=1




"let g:far#default_file_mask = '*'

"nnoremap <C-F> :F
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

" shortcut for far.vim find
"nnoremap <silent> <C-f>  :Farf<cr>
"vnoremap <silent> <C-f>  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <leader>r  :Farr<cr>
vnoremap <silent> <leader>r  :Farr<cr>

nmap <s-t> :TagbarToggle<CR>
"nnoremap t] :call tagbar#jumpToNearbyTag(1)
"nnoremap t[ :call tagbar#jumpToNearbyTag(-1)
"set <CS-F>=^[f
" Search with Ack (sa)
"nnoremap <leader>sa :Ack! -S --python<Space>
" Search in current buffer/file only
"nnoremap <C-F> :AckWindow! -S --python<Space> 
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
"set hidden
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


" Plugin Specific configurations
" To start nerdtree on startup
let g:nerdtree_tabs_open_on_console_startup=1
"Airline Plugin: show tabs
let g:airline#extensions#tabline#enabled = 1
"Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"ALE plugin 
"let b:ale_fixers = ['prettier', 'eslint']
"let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}

"YCM Plugin configs:
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
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


"Jedi Plugin:
"let g:jedi#show_call_signatures = 0 
"let g:jedi#show_call_signatures_modes = 'ni'
"let g:jedi#use_tabs_not_buffers = 0 
"let g:jedi#use_splits_not_buffers = "right" 
"execute 'nnoremap <buffer> '.g:jedi#goto_command.' :call jedi#goto()<CR>zz'
"nnoremap <C-space> :tab sp | set nodiff<CR>
"let g:jedi#completions_enabled = 1 
"let g:jedi#goto_command = "<C-b>"
"let g:jedi#usages = "<leader>pl"
"nnoremap <ESC>[65;6u <leader>pl
"let g:pymode_rope = 0
"set completeopt=menuone,longest,preview
"set previewnopup=height:60,width:60
"set completepopup=height:10,width:60,highlight:Pmenu,border:off
"set completeopt+=popup
"autocmd FileType python setlocal completeopt-=preview

" Gruvbox-material Plugin: theme specificitations
let g:gruvbox_material_background = 'hard'
let g:airline_theme = 'gruvbox_material'
let g:lightline = {'colorscheme' : 'gruvbox_material', 'gruvbox_material_palette':'mix'}
let g:gruvbox_material_palette = 'mix'
colorscheme gruvbox-material
set t_Co=256
set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif


" Key rebindings
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
" Check this for MacOS: https://apple.stackexchange.com/questions/341993/macos-can-i-disable-f12-ctrl-left-arrow-ctrl-right-arrow sadsa sa dasda 
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>
"nnoremap <C-t> :tabnew<CR>
"nnoremap <Tab> :tabnext<CR>
"nnoremap <s-Tab> :tabprev<CR>
"nnoremap <leader>q :tabclose<CR>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"au VimEnter * ALEToggle
"au VimEnter * NERDTree
"au VimEnter * NERDTreeTabsOpen
"autocmd BufEnter * NERDTreeMirror
"let g:nerdtree_tabs_open_on_new_tab = 1
"let NERDTreeMapOpenInTab='<ENTER>'
"autocmd BufNew * execute ":tabmove99"

syntax enable
"filetype on
"filetype detect
"set clipboard=unnamedplus
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

"function! ScrollPopup(down)
    "let winid = popup_findinfo()
    "if winid == 0
        "return 0
    "endif

    "" if the popup window is hidden, bypass the keystrokes
    "let pp = popup_getpos(winid)
    "if pp.visible != 1
        "return 0
    "endif

    "let firstline = pp.firstline + a:down
    "let buf_lastline = str2nr(trim(win_execute(winid, "echo line('$')")))
    "if firstline < 1
        "let firstline = 1
    "elseif pp.lastline + a:down > buf_lastline
        "let firstline = firstline - a:down + buf_lastline - pp.lastline
    "endif

    "" The appear of scrollbar will change the layout of the content which will cause inconsistent height.
    "call popup_setoptions( winid,
                "\ {'scrollbar': 0, 'firstline' : firstline } )

    "return 1
"endfunction
"inoremap <expr> <C-e> ScrollPopup(3) ? '' : '<C-e>'
"inoremap <expr> <C-y> ScrollPopup(-3) ? '' : '<C-y>'
"map <expr> <C-e> ScrollPopup(2) ? '' : '<C-e>'
"map <expr> <C-y> ScrollPopup(-3) ? '' : '<C-y>'
"nnoremap <C-e> :call ScrollPopup(1)<CR>
"nnoremap <C-y> :call ScrollPopup(0)<CR>

"function ScrollPopup(down)
    "let winid = popup_findinfo()
    "if winid == 0
        "return 0
    "endif
    "echo "$winid"
    "" The popup window has been hidden in the normal mode, we should make it show again.
    "call popup_show(winid)
    "let pp = popup_getpos(winid)
    "call popup_setoptions( winid,
                "\ {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } ) 

    "return 1
"endfunction

