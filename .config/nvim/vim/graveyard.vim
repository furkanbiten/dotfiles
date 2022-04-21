
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
