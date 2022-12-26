local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- Python
		-- null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.isort,
		-- null_ls.builtins.diagnostics.flake8
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.prettier,
	},
	on_attach = require("lsp-format").on_attach,
	-- function()
	-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
	-- require "lsp-format".on_attach
	-- end,
})
