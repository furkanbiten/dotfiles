return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    {
        "eandrju/cellular-automaton.nvim",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
            vim.keymap.set("n", "<leader>mg", "<cmd>CellularAutomaton game_of_life<CR>")
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        "jpalardy/vim-slime",
        init = function()
            vim.g.slime_no_mappings = 1
        end
    },
    {
        "pechorin/any-jump.vim",
        event = "VeryLazy",
    },
    -- { "tpope/vim-surround" },
    { "wellle/targets.vim" },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup()
        end

    },
    {
        'stevearc/dressing.nvim',
        event = "VeryLazy",
        opts = {},
    },
}
