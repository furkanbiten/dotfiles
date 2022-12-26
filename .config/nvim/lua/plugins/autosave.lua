require("auto-save").setup({
	debounce_delay = 2500, -- saves the file at most every `debounce_delay` milliseconds
})
vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})
