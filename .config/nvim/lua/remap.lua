
vim.g.mapleader = ","
vim.g.localleader = ","
vim.keymap.set("n", "<leader><Space>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<ESC>", { silent = true })

vim.keymap.set("i", "<C-k>", "<C-o>d$", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>qa", ":qall!<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>qw", ":q<CR>", { silent = true })

-- Close the current buffer and move to the previous one.
-- This replicates the idea of closing a tab, however be warned
-- it will close without saving anything!
vim.keymap.set({ "n", "v" }, "<leader>qq", ":bp <BAR> bd! #<CR>", { silent = true })
-- Quit window
vim.keymap.set({ "n", "v" }, "<leader>qw", ":q<CR>", { silent = true })
-- Move to the next buffer
vim.keymap.set({ "n", "v" }, "<Tab>", ":bnext<CR>", { silent = true })
-- Move to the previous buffer
vim.keymap.set({ "n", "v" }, "<s-Tab>", ":bprev<CR>", { silent = true })

-- Moving between splits with arrow keys, sorry Vim, I don't deserve you :(
vim.keymap.set({ "n", "v" }, "<C-Down>", "<C-W><C-J>", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-UP>", "<C-W><C-K>", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-Left>", "<C-W><C-H>", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-Right>", "<C-W><C-L>", { silent = true })

-- Move text up and then
vim.keymap.set("n", "<A-s>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-w>", ":m .-2<CR>==", { silent = true })

vim.keymap.set("i", "<A-s>", "<ESC>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-w>", "<ESC>:m .-2<CR>==gi", { silent = true })

vim.keymap.set("v", "<A-s>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-w>", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set({ "v", "n" }, "<leader>ve", "<ESC>^vg_", { silent = true })

-- Delete word forward, counter of C-W in insert
vim.keymap.set("i", "<C-q>", "<C-o>dw", { silent = true })
-- Page up and down keeping it in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- AnyJump plugin keymaps
vim.keymap.set("n", "<leader>aj", ":AnyJump<CR>", { silent = true })
vim.keymap.set("v", "<leader>aj", ":AnyJumpVisual<CR>", { silent = true })
vim.keymap.set("n", "<leader>ab", ":AnyJumpBack<CR>", { silent = true })
vim.keymap.set("n", "<leader>al", ":AnyJumpLastResults<CR>", { silent = true })
vim.cmd([[
" Terminal Settings
if has("nvim")
    tnoremap <silent> <Esc> <C-\><C-n>`.$
    tnoremap <A-left> <C-\><C-n><C-w>h
    tnoremap <A-down> <C-\><C-n><C-w>j
    tnoremap <A-up> <C-\><C-n><C-w>k
    tnoremap <A-right> <C-\><C-n><C-w>l
    autocmd BufEnter term://* startinsert
endif

let g:slime_target = 'tmux'
" fix paste issues in ipython
" let g:slime_python_ipython = 1
let g:slime_bracketed_paste = 1
" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
                        \ 'socket_name': get(split($TMUX, ','), 0),
                        \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeParagraphSend
nmap <leader>sv     <Plug>SlimeConfig
nmap <Leader>sl <Plug>SlimeLineSend

]])
