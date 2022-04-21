-- require('Comment').setup()
--require"fidget".setup{}
--require("toggleterm").setup{}
--function _G.set_terminal_keymaps()
  --local opts = {noremap = true}
  --vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  --vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  ----vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  ----vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  ----vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  ----vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
--end
---- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
require'trouble'.setup {}
require'bufferline'.setup {}
-- require('feline').setup{}
require('lualine').setup {
    options = {
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''}
    },

    sections = {
        lualine_c = {
            {'filename', path = 1}, {
                'diagnostics',

                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                --sources = {'nvim_lsp'},

                -- Displays diagnostics for the defined severity types
                ections = {'error', 'warn', 'info', 'hint'}

            }
        }
    }
}

require('gitsigns').setup {
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'double',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    }
}

vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineContextChar guifg=#D27E99 gui=nocombine]]
-- vim.opt.listchars:append("space:‚ãÖ")
vim.opt.listchars:append("eol: ")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true
    -- space_char_highlight_list = {"IndentBlanklineIndent1"}
}

-- require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })
-- require("luasnip.loaders.from_vscode").load()
