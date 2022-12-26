require("illuminate").configure({
	delay = 700,
	providers = {
		"lsp",
		-- "treesitter",
		-- 'regex',
	},
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"NvimTree",
	},
})

-- vim.cmd([[augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * highlight illuminatedCurWord cterm=italic gui=italic
-- augroup END]])
vim.cmd("hi IlluminatedWordRead gui=none cterm=none guibg=#1d3b53")
vim.cmd("hi IlluminatedWordText gui=none cterm=none guibg=none")
vim.cmd("hi IlluminatedWordWrite gui=none cterm=none guibg=none")
-- vim.cmd("hi illuminatedCurWord gui=underline cterm=none")
