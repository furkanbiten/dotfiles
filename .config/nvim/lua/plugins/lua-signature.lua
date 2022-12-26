local signature_config = {
	log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
	debug = true,
	hint_enable = false,
	handler_opts = { border = "single" },
	toggle_key = "<M-Tab>",
	timer_interval = 2000,
	max_width = 80,
}
require("lsp_signature").setup(signature_config)
