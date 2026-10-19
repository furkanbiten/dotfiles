-- nvim-treesitter `main` branch (needs nvim >= 0.11, the `tree-sitter` CLI and a C compiler to build parsers)
local parsers = {
    "vimdoc", "javascript", "typescript", "c", "lua", "rust",
    "jsdoc", "bash", "markdown", "markdown_inline", "python", "vim", "query",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            ts.install(parsers)

            -- highlighting + indent for every filetype that has a parser; install missing parsers on demand
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if not lang then return end
                    local function start()
                        if pcall(vim.treesitter.start, args.buf, lang) then
                            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                            if lang == "markdown" then
                                vim.bo[args.buf].syntax = "on" -- keep regex highlighting next to treesitter
                            end
                        end
                    end
                    if vim.tbl_contains(ts.get_installed(), lang) then
                        start()
                    elseif vim.tbl_contains(ts.get_available(), lang) then
                        ts.install(lang):await(function() vim.schedule(start) end)
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true }, -- jump forward to the textobject, like targets.vim
                move = { set_jumps = true },
            })
            local select = require("nvim-treesitter-textobjects.select")
            local move = require("nvim-treesitter-textobjects.move")
            local swap = require("nvim-treesitter-textobjects.swap")

            for lhs, query in pairs({
                of = "@function.outer", ["if"] = "@function.inner",
                oc = "@class.outer", ic = "@class.inner",
            }) do
                vim.keymap.set({ "x", "o" }, lhs, function() select.select_textobject(query, "textobjects") end)
            end

            local moves = {
                goto_next_start = { ["]f"] = "@function.outer", ["]]"] = "@class.outer" },
                goto_next_end = { ["]F"] = "@function.outer", ["]["] = "@class.outer" },
                goto_previous_start = { ["[f"] = "@function.outer", ["[["] = "@class.outer" },
                goto_previous_end = { ["[F"] = "@function.outer", ["[]"] = "@class.outer" },
            }
            for fn, maps in pairs(moves) do
                for lhs, query in pairs(maps) do
                    vim.keymap.set({ "n", "x", "o" }, lhs, function() move[fn](query, "textobjects") end)
                end
            end

            vim.keymap.set("n", "<c-l>", function() swap.swap_next("@parameter.inner") end)
            vim.keymap.set("n", "<c-h>", function() swap.swap_previous("@parameter.inner") end)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup({
                multiline_threshold = 1,
            })
            vim.keymap.set("n", "<leader>ct", ":TSContextToggle<CR>", { silent = true })
            vim.keymap.set("n", "[c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true })
        end,
    },
}
