vim.opt.fillchars = { fold = " " }
require("telescope").setup({})

require("auto-save").setup({
	debounce_delay = 2500, -- saves the file at most every `debounce_delay` milliseconds
})
vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})

require("persisted").setup({
	autosave = true,
	command = "VimLeavePre",
	autoload = true,
	function()
		vim.cmd("NvimTreeClose")
	end,
})
require("telescope").load_extension("persisted")
require("aerial").setup({
	manage_folds = true,
	link_folds_to_tree = true,
	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>at", "<cmd>AerialToggle!<CR>", {})
	end,
})
require("telescope").load_extension("aerial")

require("Comment").setup({
	pre_hook = function(ctx)
		if vim.bo.filetype == "typescriptreact" then
			local U = require("Comment.utils")

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.block then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = type,
				location = location,
			})
		end
	end,
	toggler = {
		---Line-comment toggle keymap
		line = "<C-_>",
		---Block-comment toggle keymap
		--block = '<C-_>',
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "<C-_>",
		---Block-comment keymap
		block = "gb",
	},
})
vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv")

require("nvim-autopairs").setup({})
require("trouble").setup({})
require("bufferline").setup({})
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

require("gitsigns").setup({
	preview_config = {
		-- Options passed to nvim_open_win
		border = "double",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

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

------------------------------------------------------------------------
--                          Folding setup (UFO)                       --
------------------------------------------------------------------------
-- local handler = function(virtText, lnum, endLnum, width, truncate)
--     local newVirtText = {}
--     -- local suffix = (' ... %d '):format(endLnum - lnum)
--     local suffix = ('  %d '):format(endLnum - lnum)
--     local sufWidth = vim.fn.strdisplaywidth(suffix)
--     local targetWidth = width - sufWidth
--     local curWidth = 0
--     for _, chunk in ipairs(virtText) do
--         local chunkText = chunk[1]
--         local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--         if targetWidth > curWidth + chunkWidth then
--             table.insert(newVirtText, chunk)
--         else
--             chunkText = truncate(chunkText, targetWidth - curWidth)
--             local hlGroup = chunk[2]
--             table.insert(newVirtText, { chunkText, hlGroup })
--             chunkWidth = vim.fn.strdisplaywidth(chunkText)
--             -- str width returned from truncate() may less than 2nd argument, need padding
--             if curWidth + chunkWidth < targetWidth then
--                 suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
--             end
--             break
--         end
--         curWidth = curWidth + chunkWidth
--     end
--     table.insert(newVirtText, { suffix, 'MoreMsg' })
--     return newVirtText
-- end
require("ufo").setup({
	--     close_fold_kinds = {'imports'},
	-- fold_virt_text_handler = handler
})
-- local bufnr = vim.api.nvim_get_current_buf()
-- require('ufo').setFoldVirtTextHandler(bufnr, handler)

------------------------------------------------------------------------
--                      Split Manager with Tmux                       --
------------------------------------------------------------------------

require("smart-splits").setup({
	-- Ignored filetypes (only while resizing)
	ignored_filetypes = {
		"nofile",
		"quickfix",
		"prompt",
	},
	-- Ignored buffer types (only while resizing)
	ignored_buftypes = { "NvimTree" },
	-- the default number of lines/columns to resize by at a time
	default_amount = 3,
	-- whether to wrap to opposite side when cursor is at an edge
	-- e.g. by default, moving left at the left edge will jump
	-- to the rightmost window, and vice versa, same for up/down.
	wrap_at_edge = true,
	-- when moving cursor between splits left or right,
	-- place the cursor on the same row of the *screen*
	-- regardless of line numbers. False by default.
	-- Can be overridden via function parameter, see Usage.
	move_cursor_same_row = false,
	-- resize mode options
	resize_mode = {
		-- key to exit persistent resize mode
		quit_key = "<ESC>",
		-- keys to use for moving in resize mode
		-- in order of left, down, up' right
		resize_keys = { "h", "j", "k", "l" },
		-- set to true to silence the notifications
		-- when entering/exiting persistent resize mode
		silent = false,
		-- must be functions, they will be executed when
		-- entering or exiting the resize mode
		hooks = {
			on_enter = nil,
			on_leave = nil,
		},
	},
	-- ignore these autocmd events (via :h eventignore) while processing
	-- smart-splits.nvim computations, which involve visiting different
	-- buffers and windows. These events will be ignored during processing,
	-- and un-ignored on completed. This only applies to resize events,
	-- not cursor movement events.
	ignored_events = {
		"BufEnter",
		"WinEnter",
	},
	-- enable or disable the tmux integration
	tmux_integration = true,
})
-- moving between splits
vim.keymap.set("n", "<A-left>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<A-down>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<A-up>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<A-right>", require("smart-splits").move_cursor_right)
-- resizing splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

function ToggleTroubleAuto()
	local buftype = "quickfix"
	if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
		buftype = "loclist"
	end

	local ok, trouble = pcall(require, "trouble")
	if ok then
		vim.api.nvim_win_close(0, false)
		trouble.toggle(buftype)
	else
		local set = vim.opt_local
		set.colorcolumn = ""
		set.number = false
		set.relativenumber = false
		set.signcolumn = "no"
	end
end

-- require('git-conflict').setup({
--     default_mappings = true, -- disable buffer local mapping created by this plugin
--     disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
--     highlights = { -- They must have background color, otherwise the default color will be used
--         incoming = 'DiffText',
--         current = 'DiffAdd',
--     }
-- })
-- vim.keymap.set('n', 'co', '<Plug>(git-conflict-ours)')
-- vim.keymap.set('n', 'ct', '<Plug>(git-conflict-theirs)')
-- vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)')
-- vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)')
-- vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)')
-- vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)')
--
