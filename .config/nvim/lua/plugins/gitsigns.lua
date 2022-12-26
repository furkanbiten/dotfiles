require("gitsigns").setup({
	preview_config = {
		-- Options passed to nvim_open_win
		border = "double",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
