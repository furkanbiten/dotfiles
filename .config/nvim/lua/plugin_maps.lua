vim.keymap.set("n", "<leader>aj", ":AnyJump<CR>", {silent = true})
vim.keymap.set("v", "<leader>aj", ":AnyJumpVisual<CR>", {silent = true})
vim.keymap.set("n", "<leader>ab", ":AnyJumpBack<CR>", {silent = true})
vim.keymap.set("n", "<leader>al", ":AnyJumpLastResults<CR>", {silent = true})

vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv")
-- vim.opt.listchars:append("eol: ")
vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", {silent = true})
-- moving between splits
vim.keymap.set("n", "<A-left>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<A-down>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<A-up>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<A-right>", require("smart-splits").move_cursor_right)
-- resizing splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

vim.cmd[[
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
]]
