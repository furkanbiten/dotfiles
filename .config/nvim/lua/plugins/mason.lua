require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "vimls", "yamlls", "jsonls" },
})
require("mason-null-ls").setup({
	ensure_installed = {},
})
