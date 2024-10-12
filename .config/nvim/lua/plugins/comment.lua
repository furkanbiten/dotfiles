return {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        require("Comment").setup({
            pre_hook = function(ctx)
                if vim.bo.filetype == "typescriptreact" then
                    local U = require("Comment.utils")

                    -- Determine whether to use linewise or blockwise commentstring
                    local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

                    -- Determine the location where to calculate commentstring from
                    local location = nil
                    if ctx.ctype == U.ctype.block then
                        location = require("ts_context_commentstring.utils").get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = require("ts_context_commentstring.utils").get_visual_start_location()
                    end

                    return require("ts_context_commentstring.internal").calculate_commentstring({
                        key = type,
                        location = location,
                    })
                end
            end,
            toggler = {
                ---Line-comment toggle keymap
                line = "<C-_>",
                ---Block-comment toggle keymap
                --block = '<C-_>',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = "<C-_>",
                ---Block-comment keymap
                block = "gb",
            },
            vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv")
        })
    end
}
