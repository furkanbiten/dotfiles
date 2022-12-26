vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineContextChar guifg=#D27E99 gui=nocombine]])
-- vim.opt.listchars:append("space:‚ãÖ")
vim.opt.listchars:append("eol: ")

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	-- space_char_highlight_list = {"IndentBlanklineIndent1"}
})
