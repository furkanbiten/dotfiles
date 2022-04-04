------------------------
--  Signature Config  --
------------------------
local signature_config = {
    log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
    debug = true,
    hint_enable = false,
    handler_opts = {border = "single"},
    max_width = 80
}

require("lsp_signature").setup(signature_config)
-- require'lspconfig'.pyright.setup{}
-- require'coq'.setup{coq.lsp_ensure_capabilities()}
-- require'lspconfig'.pyre.setup{}

----------------------
--  Linting Config  --
----------------------

require("lint").linters_by_ft = {python = {"flake8", "pycodestyle"}}
local pycodestyle = require("lint.linters.pycodestyle")
pycodestyle.args = {
    "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s", "--ignore=E223,E501",
    "-"
}

---------------------------------------
--  Autocompletion library nvim-cmp  --
---------------------------------------

local cmp = require 'cmp'
local lspkind = require('lspkind')
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        })
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        -- ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end, {"i", "s" --[[ "c" (to enable the mapping in command mode) ]] }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
        end, {"i", "s" --[[ "c" (to enable the mapping in command mode) ]] }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        {name = 'ultisnips'} -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {{name = 'buffer'}}),
    experimental = {ghost_text = true}
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_installer = require "nvim-lsp-installer"
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<space>e',
                        '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<space>q',
                        '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

require("aerial").setup({
    on_attach = function(bufnr)
        -- Toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a',
                                    '<cmd>AerialToggle!<CR>', {})
        -- Jump forwards/backwards with '{' and '}'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
        -- Jump up the tree with '[[' or ']]'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>',
                                    {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>',
                                    {})
    end
})

-- require("lsp-format").setup {}
local function on_attach(client, bufnr)
    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
                                '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa',
                                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr',
                                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
                                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f',
                                '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    require("aerial").on_attach(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    -- require "lsp-format".on_attach(client)
end

local enhance_server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ["pyright"] = function(opts)
        --  opts.handlers = {
        --          ['textDocument/publishDiagnostics'] = function(...) end
        --          }
        opts.settings = {
            -- cmd = os.getenv("CONDA_PREFIX")..'/bin/python',
            python = {analysis = {typeCheckingMode = "off"}}
        }
    end
}

lsp_installer.on_server_ready(function(server)
    -- Specify the default options which we'll use to setup all servers
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
        -- handlers = {
        --     ['textDocument/publishDiagnostics'] = function(...) end
        -- },
    }
    if enhance_server_opts[server.name] then
        -- Enhance the default opts with the server-specific ones
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)

-- local null_ls = require("null-ls")
-- null_ls.setup({
-- sources = {
-- Python
-- null_ls.builtins.formatting.autopep8,
-- null_ls.builtins.formatting.isort,
-- null_ls.builtins.diagnostics.flake8,
-- null_ls.builtins.formatting.black,
-- null_ls.builtins.formatting.prettier,
-- },
-- on_attach = function()
-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
-- end,
-- })

vim.diagnostic.config({
    underline = false,
    virtual_text = true,
    signs = true,
    update_in_insert = false
})

