-- smart-splits v3: multiplexer support lives in separate backend plugins (no auto-detection)
return {
    {
        "smart-splits-nvim/smart-splits.nvim",
        lazy = false, -- the tmux backend must load at startup so tmux knows the pane runs nvim
        dependencies = {
            { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
        },
        opts = {
            mux = { backend = "smart-splits-backend-tmux" },
            ignored_buftypes = { "nofile", "quickfix", "prompt" },
            ignored_filetypes = { "NvimTree" },
            resize = { amount = 3 },
        },
        config = function(_, opts)
            local ss = require("smart-splits")
            ss.setup(opts)
            -- moving between splits (and into tmux panes at the edge)
            vim.keymap.set("n", "<A-left>", ss.move_cursor_left)
            vim.keymap.set("n", "<A-down>", ss.move_cursor_down)
            vim.keymap.set("n", "<A-up>", ss.move_cursor_up)
            vim.keymap.set("n", "<A-right>", ss.move_cursor_right)
            -- resizing splits
            vim.keymap.set("n", "<A-h>", ss.resize_left)
            vim.keymap.set("n", "<A-j>", ss.resize_down)
            vim.keymap.set("n", "<A-k>", ss.resize_up)
            vim.keymap.set("n", "<A-l>", ss.resize_right)
        end,
    },
}
