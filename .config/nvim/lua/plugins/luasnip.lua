local types = require("luasnip.util.types")

require("luasnip").setup({
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "DiffAdd" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "DiffDelete" } },
			},
		},
	},
})

-- Loading any vscode snippets from plugins
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- Allow jsx and tsx to use js snippets
-- require("luasnip").filetype_extend("javascript", { "javascriptreact", "typescriptreact" })

-- Mappins to move around inside snippets
-- vim.keymap.set({ "i", "s" }, "<Tab>", '<CMD>lua require("luasnip").jump(1)<CR>')
-- vim.keymap.set({ "i", "s" }, "<S-Tab>", '<CMD>lua require("luasnip").jump(-1)<CR>')
-- vim.cmd([[
-- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- " -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
--
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
--
-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- ]])
