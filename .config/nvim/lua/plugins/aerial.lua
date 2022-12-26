require("aerial").setup({
	manage_folds = true,
	link_folds_to_tree = true,
	-- on_attach = function(bufnr)
	-- Toggle the aerial window with <leader>a
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>at", "<cmd>AerialToggle!<CR>", {})
	-- end,
})
require("telescope").load_extension("aerial")
