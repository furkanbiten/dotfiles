return {
    "danymat/neogen",
    event="VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local neogen = require("neogen")

        neogen.setup({
            snippet_engine = "luasnip"
        })

        vim.keymap.set("n", "<leader>gf", function()
            neogen.generate({ type = "func" })
        end)

        vim.keymap.set("n", "<leader>gt", function()
            neogen.generate({ type = "type" })
        end)

    end,
}
