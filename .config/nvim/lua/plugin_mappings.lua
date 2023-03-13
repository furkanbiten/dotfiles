-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap(
    "v",
    "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "v",
    "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap(
    "n",
    "<leader>rb",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
    { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>rbf",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap(
    "n",
    "<leader>ri",
    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
-- load refactoring Telescope extension

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>mt", ":MinimapToggle<CR>", { noremap = true, silent = true, expr = false })

vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
vim.keymap.set("v", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

-- vim.cmd([[unmap sx]])
vim.keymap.set("n", "<leader>e", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ee", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
vim.keymap.set("v", "<leader>e", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ec", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
-- vim.keymap.set({ "x", "o" }, "<leader>l", "<Plug>(leap-forward-till)")

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

vim.cmd([[nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>at :AerialToggle<CR>
nnoremap <leader>rs :WinResizerStartResize<CR>
nnoremap <leader>td :TodoTelescope<CR>
""""""""""""
"  Extras  "
""""""""""""
nnoremap ct :ConflictMarkerThemselves<CR>
nnoremap co :ConflictMarkerOurselves<CR>
nnoremap cb :ConflictMarkerBoth<CR>
nnoremap cB :ConflictMarkerBoth!<CR>
nnoremap cn :ConflictMarkerNone<CR>
nnoremap [x :ConflictMarkerPrevHunk<CR>
nnoremap x] :ConflictMarkerNextHunk<CR>

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><leader>ts <Cmd>exe "ToggleTermSendCurrentLine". v:count1<CR>
vnoremap <silent><leader>tl :<c-u>exe "ToggleTermSendVisualLines". v:count1<CR>
vnoremap <silent><leader>tv :<c-u>exe "ToggleTermSendVisualSelection". v:count1<CR>
noremap <silent><leader>ta :ToggleTermToggleAll<CR>

let g:conjure#client#scheme#stdio#command = "scheme"
noremap <leader>j <Plug>Lightspeed_omni_s
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>dv :DiffviewOpen<CR>
nnoremap <leader>sb :SidebarNvimToggle<CR>
""""""""""""""""""""""
"  Packer Shortcuts "
""""""""""""""""""""""
nnoremap <silent><leader>pi :PackerInstall<CR>
nnoremap <silent><leader>ps :PackerSync<CR>
nnoremap <silent><leader>pc :PackerCompile<CR>
nnoremap <silent><leader>pl :PackerClean<CR>

"------------------------------------------------------------------------------
" Telescope keybindings configuration
"------------------------------------------------------------------------------
noremap <leader>fw :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>
noremap <leader>fa :Telescope live_grep<CR>
noremap <leader>ff :Telescope find_files<CR>
noremap <leader>fm :Telescope keymaps<CR>
noremap <leader>fg :lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>
" noremap <leader>fr :lua require("telescope").extensions.live_grep_raw.live_grep_args()<CR>
"noremap <leader>fl :lua require("telescope.builtin").lsp_references()<CR>
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            AnyJump keybindings                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Normal mode: Jump to definition under cursor
nnoremap <leader>aj :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>aj :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

"""""""""""""""""""""""
"  Ultisnips keymaps  "
"""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger="<CR>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"

"------------------------------------------------------------------------------
" Colorscheme configuration
"------------------------------------------------------------------------------
" set t_Co=256
" Important!!
" if has('termguicolors')
    " set termguicolors
" endif
let g:onedark_config = {
    \ 'style': 'deep',
\}
" colorscheme onedark
colorscheme nightfly
" highlight Normal guibg='#181d20' guifg=white
" set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
"------------------------------------------------------------------------------
" Some Lua stuff for treesitter and nvim-dap: THE debugger.
"------------------------------------------------------------------------------
"au  InsertLeave * lua require('lint').try_lint()
" au  BufWritePre * lua require('lint').try_lint()
" nnoremap <silent> <leader>l :lua require('lint').try_lint()
"au FileType dap-repl lua require('dap.ext.autocompl').attach()
nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_out()<CR>
nnoremap <silent> <F5> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
" nnoremap <leader>do :lua require'dapui'.open()<CR>
" nnoremap <leader>dc :lua require'dapui'.close()<CR>
nnoremap <leader>dt :lua require'dapui'.toggle()<CR>

"------------------------------------------------------------------------------
" Vim-slime configuration
"------------------------------------------------------------------------------
function NeoConfig() abort
    unlet b:slime_config
    let g:slime_target = "neovim"
    let b:slime_config = {"jobid": get(g:, "slime_last_channel", "")}
endfunction

function TmuxConfig() abort
    unlet b:slime_config
    let g:slime_target = "tmux"
    let b:slime_config = {
                        \ 'socket_name': get(split($TMUX, ','), 0),
                        \ 'target_pane': '{top-right}' }
endfunction

nmap <leader>sn :call NeoConfig()<CR>
nmap <leader>st :call TmuxConfig()<CR>
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
" nnoremap <Leader>d :SlimeSend1 %debug<CR>

""""""""""""""""""""""
"  Trouble mappings  "
""""""""""""""""""""""
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
nnoremap <leader>xqq :lua ToggleTroubleAuto()<cr>

au BufWritePre * lua vim.lsp.buf.format()
au User NvimGdbQuery :belowright GdbLopenBacktrace
"au User NvimGdbQuery GdbCreateWatch locals()
"au User NvimGdbQuery call nvim_buf_set_lines(bufnr(), 0, -1, 0, split(GdbCustomCommand("locals()"), "\n"))
"au  User NvimGdbQuery echo GdbCustomCommand('locals()')
let w:nvimgdb_termwin_command = "right vnew"
let w:nvimgdb_codewin_command = "vnew"]])

vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme *  highlight Normal guibg='#181d20' guifg=white
autocmd Colorscheme * highlight NvimTreeNormal guibg='#181d20' guifg=white
augroup end
]])

