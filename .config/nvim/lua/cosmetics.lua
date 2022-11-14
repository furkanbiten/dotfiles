require("auto-save").setup {}
require("auto-session").setup {
    log_level = "error",

    cwd_change_handling = {
        restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
        pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
        post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
            require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
        end,
    },
}


require("aerial").setup({
    on_attach = function(bufnr)
        -- Toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>at',
            '<cmd>AerialToggle!<CR>', {})
        -- Jump forwards/backwards with '{' and '}'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ap',
            '<cmd>AerialPrev<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>an',
            '<cmd>AerialNext<CR>', {})
        -- Jump up the tree with '[[' or ']]'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>',
            {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>',
            {})
    end
})

require('Comment').setup({ toggler = {
    ---Line-comment toggle keymap
    line = '<C-_>',
    ---Block-comment toggle keymap
    --block = '<C-_>',
},
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<C-_>',
        ---Block-comment keymap
        block = 'gb',
    } })
vim.keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)gv')
require("nvim-autopairs").setup {}
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

            },
            require('auto-session-library').current_session_name,
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
