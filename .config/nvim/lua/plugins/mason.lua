require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "pyright", "vimls", "yamlls", "jsonls" },
})
require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq" },
})
