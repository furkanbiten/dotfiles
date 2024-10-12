return {
    'stevearc/aerial.nvim',
    event="VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config=function ()
        require("aerial").setup({
            -- manage_folds = true,
            -- link_folds_to_tree = true,
            -- on_attach = function(bufnr)
            -- Toggle the aerial window with <leader>a
            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>at", "<cmd>AerialToggle!<CR>", {})
            -- end,
        })
        vim.keymap.set("n", "<leader>at", ":AerialToggle<CR>", {silent = true})
    end
}
