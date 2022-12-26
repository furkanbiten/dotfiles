require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},

	sections = {
		lualine_c = {
			{ "filename", path = 1 },
			{
				"diagnostics",
				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				--sources = {'nvim_lsp'},

				-- Displays diagnostics for the defined severity types
				ections = { "error", "warn", "info", "hint" },
			},
			-- require('auto-session-library').current_session_name,
		},
	},
})
