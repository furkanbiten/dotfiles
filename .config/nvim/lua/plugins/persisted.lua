vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,resize,winpos,terminal"
require("persisted").setup({
	autosave = true,
	command = "VimLeavePre",
	autoload = true,
	function()
		vim.cmd("NvimTreeClose")
	end,
})

require("telescope").load_extension("persisted")
