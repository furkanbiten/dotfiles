"""""""""
"  LUA  "
"""""""""
" lua require('dap_config')
lua require('treesitter')
lua require('lsp')
lua require('cosmetics')

nnoremap <leader>t :NvimTreeToggle<CR>
let g:winresizer_start_key = '<C-T>'
""""""""""""
"  Extras  "
""""""""""""
let g:conjure#client#scheme#stdio#command = "scheme"
noremap s <Plug>Lightspeed_omni_s
nnoremap <leader>u :UndotreeToggle<CR>

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
noremap <leader>fw :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>
noremap <leader>fa :Telescope live_grep<CR>
noremap <leader>ff :Telescope find_files<CR>
noremap <leader>fm :Telescope keymaps<CR>
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
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"

"------------------------------------------------------------------------------
" Colorscheme configuration
"------------------------------------------------------------------------------
set t_Co=256
" Important!!
if has('termguicolors')
    set termguicolors
endif
colorscheme nightfly
highlight Normal guibg='#181d20' guifg=white
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
"------------------------------------------------------------------------------
" Some Lua stuff for treesitter and nvim-dap: THE debugger.
"------------------------------------------------------------------------------
"au  InsertLeave * lua require('lint').try_lint()
au  BufWritePre * lua require('lint').try_lint()
nnoremap <silent> <leader>l :lua require('lint').try_lint()
"au FileType dap-repl lua require('dap.ext.autocompl').attach()
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
nnoremap <Leader>d :SlimeSend1 %debug<CR>

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

au User NvimGdbQuery :belowright GdbLopenBacktrace
"au User NvimGdbQuery GdbCreateWatch locals()
"au User NvimGdbQuery call nvim_buf_set_lines(bufnr(), 0, -1, 0, split(GdbCustomCommand("locals()"), "\n"))
"au  User NvimGdbQuery echo GdbCustomCommand('locals()')
let w:nvimgdb_termwin_command = "right vnew"
let w:nvimgdb_codewin_command = "vnew"
