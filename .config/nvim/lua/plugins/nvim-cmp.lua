-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu

local lspkind_opts = {
	with_text = true,
	preset = "codicons", -- need to install font https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.ttf
}

local source_mapping = {
	nvim_lsp = "[LSP]",
	luasnip = "[Snippet]",
	treesitter = "[TS]",
	nvim_lua = "[Vim]",
	path = "[Path]",
	buffer = "[Buffer]",
}

local cmp_helper = {}
local cmp = require("cmp")
local lspkind = require("lspkind")
-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,

	performance = {
		debounce = 30,
		throttle = 10,
		fetching_timeout = 100,
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.symbolic(vim_item.kind, lspkind_opts)
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
		-- ["<Tab>"] = cmp.mapping.select_next_item(),
		["<Tab>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
				else
					fallback()
				end
			end,
		}),
		["<S-Tab>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
				else
					fallback()
				end
			end,
		}),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = {
		{ name = "nvim_lsp", priority = 99 },
		{ name = "ultisnips", priority = 90 }, -- For ultisnips users.
		{ name = "nvim_lua", priority = 80 },
		{ name = "path", priority = 10 },
		{ name = "buffer", priority = 0 },
		-- { name = "crates", priority = 90 },
		-- { name = "omni" },
		{ name = "dap" },
	},

	experimental = { ghost_text = true },
	sorting = {
		-- see ~/.vim/plugged/nvim-cmp/lua/cmp/config/compare.lua
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			function(...)
				return cmp_helper.compare.prioritize_argument(...)
			end,
			function(...)
				return cmp_helper.compare.deprioritize_underscore(...)
			end,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- Custom sorting/ranking for completion items.
cmp_helper.compare = {
	-- Deprioritize items starting with underscores (private or protected)
	deprioritize_underscore = function(lhs, rhs)
		local l = (lhs.completion_item.label:find("^_+")) and 1 or 0
		local r = (rhs.completion_item.label:find("^_+")) and 1 or 0
		if l ~= r then
			return l < r
		end
	end,
	-- Prioritize items that ends with "= ..." (usually for argument completion).
	prioritize_argument = function(lhs, rhs)
		local l = (lhs.completion_item.label:find("=$")) and 1 or 0
		local r = (rhs.completion_item.label:find("=$")) and 1 or 0
		if l ~= r then
			return l > r
		end
	end,
}

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, { { name = "buffer" } }),
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
	sources = {
		{ name = "dap" },
	},
})
