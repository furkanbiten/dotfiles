""-----------------------
" Vim specific commands
"-----------------------
let mapleader=","
let maplocalleader=","
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim native mapping for frequently used mappings  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> <ESC>
ino <C-c> <ESC>
"map jj <ESC>
inoremap <C-k> <C-o>d$
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>qa :qall!<CR>
noremap <silent> <leader>qw :q<CR>
" Close the current buffer and move to the previous one. This replicates the idea of closing a tab, however be warned it will close without saving anything!
noremap <leader>qq :bp <BAR> bd! #<CR>
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>
" Move to the next buffer
nnoremap <Tab> <Cmd>Tabnext<CR>
" Move to the previous buffer
nnoremap <s-Tab> <Cmd>Tabprevious<CR>
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

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

vnoremap il <ESC>^vg_
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>) ciw(<c-r>")<esc>


lua <<EOF
local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

M.my_vscode = augroup('MyVSCode', {})

vim.filetype.add {
    pattern = {
        ['.*%.ipynb.*'] = 'python',
        -- uses lua pattern matching
        -- rathen than naive matching
    },
}

local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
    return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

keymap('n', '<Leader>fr', notify 'references-view.findReferences', { silent = true }) -- language references
keymap('n', '<Leader>gp', notify 'workbench.actions.view.problems', { silent = true }) -- language diagnostics
keymap('n', 'gr', notify 'editor.action.goToReferences', { silent = true })
keymap('n', '<Leader>rn', notify 'editor.action.rename', { silent = true })
keymap('n', '<Leader>fm', notify 'editor.action.formatDocument', { silent = true })
keymap('n', '<Leader>ca', notify 'editor.action.refactor', { silent = true }) -- language code actions

keymap('n', '<Leader>rg', notify 'workbench.action.findInFiles', { silent = true }) -- use ripgrep to search files
keymap('n', '<Leader>ts', notify 'workbench.action.toggleSidebarVisibility', { silent = true })
keymap('n', '<Leader>th', notify 'workbench.action.toggleAuxiliaryBar', { silent = true }) -- toggle docview (help page)
keymap('n', '<Leader>tp', notify 'workbench.action.togglePanel', { silent = true })
keymap('n', '<Leader>fc', notify 'workbench.action.showCommands', { silent = true }) -- find commands
keymap('n', '<Leader>ff', notify 'workbench.action.quickOpen', { silent = true }) -- find files
keymap('n', '<Leader>tw', notify 'workbench.action.terminal.toggleTerminal', { silent = true }) -- terminal window

keymap('v', '<Leader>fm', v_notify 'editor.action.formatSelection', { silent = true })
keymap('v', '<Leader>ca', v_notify 'editor.action.refactor', { silent = true })
keymap('v', '<Leader>fc', v_notify 'workbench.action.showCommands', { silent = true })


keymap('n', '<Leader>w', notify 'workbench.action.files.save', { silent = true })
keymap('n', '<Leader>qq', notify 'workbench.action.closeActiveEditor', {silent = true})

--keymap('n', '<Ctrl-Tab>', notify 'workbench.action.nextPanelView', { silent = true })
return M
EOF
