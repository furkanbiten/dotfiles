-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "init.lua",
	command = "source <afile> | PackerCompile",
})

vim.cmd([[packadd packer.nvim]])

require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- Optimization plugins
		use({ "lewis6991/impatient.nvim" })
		use({ "nathom/filetype.nvim" })
		use({ "luukvbaal/stabilize.nvim" })

		use({ "nvim-lua/plenary.nvim" })

		use({
			"neovim/nvim-lspconfig",
			requires = {
				{ -- WARN: Unfortunately we won't be able to lazy load this
					"hrsh7th/cmp-nvim-lsp",
				},
			},
		})
		use({
			"williamboman/mason.nvim",
			requires = {
				{ "williamboman/mason-lspconfig.nvim" },
				{ "jayp0521/mason-null-ls.nvim" },
			},
			config = "require 'plugins.mason'",
		})

		-- use({ "folke/neodev.nvim", config = "require 'plugins.neodev'" })
		--------------------
		--  Autocomplete  --
		--------------------
		use({
			"hrsh7th/nvim-cmp",
			-- event = "BufRead",
			config = "require 'plugins.nvim-cmp'",
			requires = {
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{ "petertriho/cmp-git", after = "nvim-cmp" },
				{ "hrsh7th/cmp-omni", after = "nvim-cmp" },
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "quangnguyen30192/cmp-nvim-ultisnips", after = "nvim-cmp" },
				{ "onsails/lspkind-nvim" },
			},
		})
		use({ "ray-x/lsp_signature.nvim", config = "require 'plugins.lua-signature'", after = "nvim-cmp" })
		use({
			"SirVer/ultisnips",
			requires = { { "honza/vim-snippets" } },
			-- after = "nvim-cmp",
			config = "require 'plugins.ultisnips'",
		})
		------------------------------
		--  Linting and formatting  --
		------------------------------
		use({ "mfussenegger/nvim-lint", config = "require 'plugins.nvim-lint'" })
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			requires = { "lukas-reineke/lsp-format.nvim" },
			config = "require 'plugins.null-ls'",
		})

		------------------------------------
		--  Treesitter and its utilities  --
		------------------------------------

		use({
			"nvim-treesitter/nvim-treesitter",
			-- run = ":TSUpdate",
			-- event = "BufWinEnter",
			requires = {
				{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			},
			config = "require 'plugins.nvim-treesitter'",
		})
		use({
			"nvim-treesitter/nvim-treesitter-context",
			config = "require 'plugins.treesitter-context'",
			after = "nvim-treesitter",
		})

		use({ "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle", config = "require 'plugins.nvim-tree'" })
		-----------------
		--  Debuggers  --
		-----------------
		-- use({ "sakhnik/nvim-gdb"})
		use({
			"mfussenegger/nvim-dap",
			-- STUPID cmp-dap depends on nvim-dap, and nvim-cmp depends on cmp-dap to be activated so we need nvim-dap to be loaded
			-- IT IS A FUCKING STUPID CYCLE AND WE CAN NOT LAZY LOAD.
			event = "BufRead",
			config = "require 'dap.dap-config'",
			-- keys = { "<leader>ld" },
		})

		use({ "mfussenegger/nvim-dap-python", config = "require 'dap.dap-python'", after = "nvim-dap" })
		use({ "rcarriga/cmp-dap", after = { "nvim-dap", "nvim-cmp" } })
		use({
			"nvim-telescope/telescope-dap.nvim",
			after = { "nvim-dap", "telescope.nvim" },
			config = "require 'dap.telescope-dap'",
		})
		use({
			"theHamsta/nvim-dap-virtual-text",
			after = "nvim-dap",
			config = "require 'dap.dap-virtual'",
		})

		use({
			"rcarriga/nvim-dap-ui",
			after = "nvim-dap",
			config = "require 'dap.dap-ui'",
		})

		-----------------------
		--  Some UI plugins  --
		-----------------------
		-- Well, I mean it is telescope
		use({
			"nvim-telescope/telescope.nvim",
			-- cmd = { "Telescope" },
			requires = {
				"gbrlsnchs/telescope-lsp-handlers.nvim",
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- "nvim-telescope/telescope-symbols.nvim",
			},
			event = "BufWinEnter",
			config = "require 'plugins.telescope-config'",
		})
		-- Pretty indent colors
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = "require 'plugins.indent'",
			after = "nvim-treesitter",
		})
		-- Pretty icons
		use({ "kyazdani42/nvim-web-devicons", event = "BufRead" })
		-- Smooth scrolling
		use({
			"karb94/neoscroll.nvim",
			event = "WinScrolled",
			config = "require 'plugins.neoscroll'",
		})
		-- Dim the unused variable
		use({
			"zbirenbaum/neodim",
			event = "BufRead",
			after = "nvim-treesitter",
			config = { "require 'plugins.neodim'" },
		})
		-- pretty rename window
		use({ "stevearc/dressing.nvim", event = "BufRead" })
		-- Pretty quickfix window
		use({ "kevinhwang91/nvim-bqf", event = "BufRead" })
		-- Buffers tab
		use({ "akinsho/bufferline.nvim", event = "BufRead", config = "require 'plugins.bufferline'" })
		-- Pretty bar
		use({ "nvim-lualine/lualine.nvim", event = "BufRead", config = "require 'plugins.lualine'" })
		-- Highlight symbols under the cursor
		use({ "RRethy/vim-illuminate", event = "BufRead", config = "require 'plugins.illuminate'" })

		-- Load By Command
		use({
			"wfxr/minimap.vim",
			run = "cargo install code-minimap",
			config = "require 'plugins.minimap'",
			cmd = "MinimapToggle",
		})
		use({
			"folke/todo-comments.nvim",
			config = "require 'plugins.todo'",
			cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
		})
		use({
			"folke/trouble.nvim",
			cmd = { "TroubleToggle", "TroubleToggle document_diagnostics", "TroubleToggle lsp_references" },
			config = "require 'plugins.trouble'",
		})
		-- use({
		-- 	"folke/noice.nvim",
		-- 	config = function()
		-- 		require("noice").setup({
		-- 			lsp = {
		-- 				progress = {
		-- 					enabled = false,
		-- 				},
		-- 			},
		-- 			messages = {
		-- 				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- 				-- This is a current Neovim limitation.
		-- 				enabled = false, -- enables the Noice messages Utilities
		-- 			},
		-- 			-- add any options here
		-- 		})
		-- 	end,
		-- 	requires = {
		-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		-- 		"MunifTanjim/nui.nvim",
		-- 		-- OPTIONAL:
		-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
		-- 		--   If not available, we use `mini` as the fallback
		-- 		"rcarriga/nvim-notify",
		-- 	},
		-- })
		--------------------------------------------------------
		-- Utilities (comment, jump, lightspeed, git, etc.)  --
		--------------------------------------------------------

		-- LOAD always
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = "require 'plugins.toggleterm'",
		})
		use({ "gbprod/substitute.nvim" })
		use({ "tpope/vim-repeat" })
		use({
			"numToStr/Comment.nvim",
			requires = { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
			config = { "require 'plugins.comment'" },
			after = "nvim-treesitter",
		})
		use({
			"olimorris/persisted.nvim",
			config = { "require 'plugins.persisted'" },
			after = "telescope.nvim",
		})
		--use({
		--	"rmagatti/session-lens",
		--	requires = "rmagatti/auto-session",
		--	config = "require 'plugins.autosession'",
		--}) -- session management
		use({ "furkanbiten/auto-save.nvim", config = { "require 'plugins.autosave'" } })

		-- Load by Event
		use({
			"windwp/nvim-autopairs",
			event = "BufRead",
			after = "nvim-cmp",
			config = { "require 'plugins.autopair'" },
		})
		use({ "tpope/vim-surround", event = "BufRead" })
		use({ "wellle/targets.vim", event = "BufRead" })
		use({ "lewis6991/gitsigns.nvim", event = "BufRead", config = { "require 'plugins.gitsigns'" } })
		use({ "mrjones2014/smart-splits.nvim", event = "BufRead", config = { "require 'plugins.smart-splits'" } })

		-- Load By Command
		use({
			"ggandor/lightspeed.nvim",
			keys = { "<Plug>Lightspeed_omni_s" },
		})

		use({ "pechorin/any-jump.vim", cmd = { "AnyJump", "AnyJumpVisual" } })
		use({ "junegunn/gv.vim", cmd = "GV" })
		use({ "tpope/vim-fugitive", cmd = { "GV" } })
		use({ "mbbill/undotree", cmd = "UndotreeToggle" })
		use({
			"jpalardy/vim-slime",
			cmd = { "SlimeConfig", "SlimeSend", "SlimeSend0", "SlimeSend1", "SlimeSendCurrentLine" },
		})
		use({ "simeji/winresizer", cmd = { "WinResizerStartResize" } })
		use({ "stevearc/aerial.nvim", cmd = { "AerialToggle" }, config = { "require 'plugins.aerial'" } })
		use({
			"rhysd/conflict-marker.vim",
			cmd = {
				"ConflictMarkerThemselves",
				"ConflictMarkerOurselves",
				"ConflictMarkerNextHunk",
				"ConflictMarkerPrevHunk",
				"ConflictMarkerTheirs",
			},
		})
		use({ "sidebar-nvim/sidebar.nvim", cmd = { "SidebarNvimToggle" }, config = { "require 'plugins.sidebar'" } })
		-- Currently refactoring nvim is very buggy, use it carefully.
		use({
			"ThePrimeagen/refactoring.nvim",
			-- after = { "telescope.nvim", "nvim-treesitter" },
			keys = { "<leader>lr" },
		})

		-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim", cmd = { "DiffviewOpen" } })
		-- Session manager/loading
		-- Too lazy to save
		-- use({ "krivahtoo/silicon.nvim", run = "./install.sh", config = "require 'plugins.silicon'" })

		--------------
		--  Themes  --
		--------------
		--use({ "rebelot/kanagawa.nvim" })
		use({ "bluz71/vim-nightfly-guicolors", config = "require 'plugins.theme'" })
		--use({ "navarasu/onedark.nvim" })
	end,
	config = { max_jobs = 16, auto_reload_compiled = true, compile_on_sync = true },
})
