require 'trouble'.setup {}
require 'bufferline'.setup {}
require('lualine').setup {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },

    sections = {
        lualine_c = {
            { 'filename', path = 1 }, {
                'diagnostics',

                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                --sources = {'nvim_lsp'},

                -- Displays diagnostics for the defined severity types
                ections = { 'error', 'warn', 'info', 'hint' }

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

function ToggleTroubleAuto()
    local buftype = "quickfix"
    if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
        buftype = "loclist"
    end

    local ok, trouble = pcall(require, "trouble")
    if ok then
        vim.api.nvim_win_close(0, false)
        trouble.toggle(buftype)
    else
        local set = vim.opt_local
        set.colorcolumn = ""
        set.number = false
        set.relativenumber = false
        set.signcolumn = "no"
    end
end
