return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },

    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", "markdown"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },

            textobjects = {
                swap = {
                    enable = true,
                    swap_next = {
                        ["<c-l>"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<c-h>"] = "@parameter.inner",
                    },
                },
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in tetobjects.scm
                        ["of"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["oc"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        })
        require 'treesitter-context'.setup {
            -- max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            multiline_threshold = 1,
        }
        vim.keymap.set("n", "<leader>ct", ":TSContextToggle<CR>", { silent = true })
        vim.keymap.set("n", "[c", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end, { silent = true })
        --
        -- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        -- treesitter_parser_config.templ = {
        --     install_info = {
        --         url = "https://github.com/vrischmann/tree-sitter-templ.git",
        --         files = { "src/parser.c", "src/scanner.c" },
        --         branch = "master",
        --     },
        -- }
        --
        -- vim.treesitter.language.register("templ", "templ")
    end
}
