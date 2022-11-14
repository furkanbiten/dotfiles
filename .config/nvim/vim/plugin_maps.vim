"""""""""
"  LUA  "
"""""""""
lua require('dap_config')
lua require('treesitter')
lua require('lsp')
lua require('cosmetics')

""""""""""""
"  Extras  "
""""""""""""
let g:conjure#client#scheme#stdio#command = "scheme"
noremap s <Plug>Lightspeed_omni_s
"nnoremap <c-h> :SidewaysLeft<cr>
"nnoremap <c-l> :SidewaysRight<cr>
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
noremap <C-F> :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>
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

"map <C-_> gc
""""""""""""""""""""""
"  Split/Join Lines  "
""""""""""""""""""""""
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

"""""""""""""""""""""""
"  Ultisnips keymaps  "
"""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"

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
"colorscheme quantum
"let g:background  = '#181d20'
"set background=dark     " dark theme
"colorscheme kanagawa
colorscheme nightfly
"colorscheme nightfox
"colorscheme material
"let g:material_style = "deep ocean"
"let g:material_style = "darker"
"hi CursorLine term=bold cterm=bold guibg=Grey40
highlight Normal guibg='#181d20' guifg=white
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
"------------------------------------------------------------------------------
" Commenter configuration so that we can use toggle comment
"------------------------------------------------------------------------------
"nmap <C-_> <Plug>NERDCommenterToggle
"vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
vmap <C-0> <Plug>(comment_toggle_linewise_visual)<CR>gv

"------------------------------------------------------------------------------
" Some Lua stuff for treesitter and nvim-dap: THE debugger.
"------------------------------------------------------------------------------
lua require('dap_config')
lua require('treesitter')
lua require('lsp')
lua require('cosmetics')
"au  InsertLeave * lua require('lint').try_lint()
au  BufWritePre * lua require('lint').try_lint()
nnoremap <silent> <leader>l :lua require('lint').try_lint()
"au  TextChanged * lua require('lint').try_lint()
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
"let g:slime_target = 'tmux'
let g:slime_target = "neovim"
"let g:slime_paste_file = "$HOME/.slime_paste"
" or maybe...
"let g:slime_paste_file = tempname()
"let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
"let g:slime_default_config = {
                        " \ 'socket_name': get(split($TMUX, ','), 0),
                        " \ 'target_pane': '{top-right}' }
"let g:slime_dont_ask_default = 1

xmap <c-x><c-x> <Plug>SlimeRegionSend
nmap <c-x><c-x> <Plug>SlimeParagraphSend
nmap <c-x>v     <Plug>SlimeConfig
" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend
" map <Leader>s to start IPython
"nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
" map <Leader>d to start debug mode
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

"let g:toggleterm_terminal_mapping = '<C-t>'
"nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
"inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
"let g:context_nvim_no_redraw = 1
au User NvimGdbQuery :belowright GdbLopenBacktrace
"au User NvimGdbQuery GdbCreateWatch locals()
"au User NvimGdbQuery call nvim_buf_set_lines(bufnr(), 0, -1, 0, split(GdbCustomCommand("locals()"), "\n"))
"au  User NvimGdbQuery echo GdbCustomCommand('locals()')
let w:nvimgdb_termwin_command = "belowright vnew"
let w:nvimgdb_codewin_command = "vnew"
