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
                sources = {'ale'},

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

