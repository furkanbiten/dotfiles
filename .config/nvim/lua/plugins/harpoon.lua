return {
    "ThePrimeagen/harpoon",
    event="VeryLazy",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>pa", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>pm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>ph", function ()  harpoon:list():remove()  end)
        vim.keymap.set("n", "<leader>pc", function ()  harpoon:list():clear() end)

        -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "[p", function() harpoon:list():prev() end)
        vim.keymap.set("n", "]p", function() harpoon:list():next() end)
    end,
}
