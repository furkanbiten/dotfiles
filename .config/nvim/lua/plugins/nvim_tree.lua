return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("nvim-tree").setup()
            vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { silent = true })
        end
    },
}
