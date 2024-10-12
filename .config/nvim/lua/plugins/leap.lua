return {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        vim.keymap.set('n', '<leader>l', '<Plug>(leap)')
        vim.keymap.set('n', '<leader>L', '<Plug>(leap-from-window)')
        vim.keymap.set({ 'x', 'o' }, '<leader>l', '<Plug>(leap-forward)')
        vim.keymap.set({ 'x', 'o' }, '<leader>L', '<Plug>(leap-backward)')
    end
}
