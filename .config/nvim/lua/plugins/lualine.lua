require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
        lualine_b = {'branch', { "filename", path = 1 },},
		lualine_c = {
			{
				"diagnostics",
				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				-- sources = {'nvim_lsp'},
                symbols = { error = " ", warn = " ", hint = " ", hint = " " },
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
				-- Displays diagnostics for the defined severity types
				-- actions = { "error", "warn", "info", "hint" },
			},
            {
      'diff',
      symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
      source = "b:gitsigns_status", -- A function that works as a data source for diff.
                    -- It must return a table as such:
                    --   { added = add_count, modified = modified_count, removed = removed_count }
                    -- or nil on failure. count <= 0 won't be displayed.
    }
			-- require('auto-session-library').current_session_name,
		},
	},
})
