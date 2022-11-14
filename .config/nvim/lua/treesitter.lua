local parsers = require("nvim-treesitter.parsers")
local enabled_list = { "clojure", "fennel", "commonlisp", "query", "scheme" }
require 'nvim-tree'.setup { open_on_setup = true }

require("nvim-treesitter.configs").setup({
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ensure_installed = "maintained",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = { "javascript" },
    rainbow = {
        enable = true,
        -- Enable only for lisp like languages
        disable = vim.tbl_filter(
            function(p)
                local disable = true
                for _, lang in pairs(enabled_list) do
                    if p == lang then disable = false end
                end
                return disable
            end,
            parsers.available_parsers()
        )
    },
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false
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
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        }
    }
})
