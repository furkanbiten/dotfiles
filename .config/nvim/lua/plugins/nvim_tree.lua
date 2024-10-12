return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("nvim-tree").setup()
        end
    },
}
