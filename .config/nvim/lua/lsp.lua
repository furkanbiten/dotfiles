------------------------
--  Signature Config  --
------------------------
local signature_config = {
    log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
    debug = true,
    hint_enable = false,
    handler_opts = { border = "single" },
    toggle_key = "<M-Tab>",
    timer_interval = 2000,
    max_width = 80
}
require("lsp_signature").setup(signature_config)
----------------------
--  Linting Config  --
----------------------
require("lint").linters_by_ft = { python = { "flake8" } }
-- local pycodestyle = require("lint.linters.pycodestyle")
-- pycodestyle.args = {
--     "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s", "--ignore=E223,E501",
--     "-"
-- }
---------------------------------------
--  Autocompletion library nvim-cmp  --
---------------------------------------
local cmp_helper = {}
local cmp = require 'cmp'
local lspkind = require('lspkind')
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end,

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        })
    },
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'path' },
        { name = 'omni' },
        { name = 'dap' },
        { name = 'ultisnips' } -- For ultisnips users.
    },
        { { name = 'buffer' } }),
    experimental = { ghost_text = true },
    sorting = {
        -- see ~/.vim/plugged/nvim-cmp/lua/cmp/config/compare.lua
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            function(...) return cmp_helper.compare.prioritize_argument(...) end,
            function(...) return cmp_helper.compare.deprioritize_underscore(...) end,
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
        local l = (lhs.completion_item.label:find "^_+") and 1 or 0
        local r = (rhs.completion_item.label:find "^_+") and 1 or 0
        if l ~= r then return l < r end
    end,
    -- Prioritize items that ends with "= ..." (usually for argument completion).
    prioritize_argument = function(lhs, rhs)
        local l = (lhs.completion_item.label:find "=$") and 1 or 0
        local r = (rhs.completion_item.label:find "=$") and 1 or 0
        if l ~= r then return l > r end
    end,
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' } -- You can specify the `cmp_git` source if you were installed it.
    }, { { name = 'buffer' } })
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})
------------------------------------------------------------------------
--                             LSP CONFIG                             --
------------------------------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
-- Setup lspconfig.
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e',
    '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    opts)
vim.api.nvim_set_keymap('n', '<space>q',
    '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- vim.keymap.set('n', 'K', function()
--     local winid = require('ufo').peekFoldedLinesUnderCursor()
--     if not winid then
--         -- choose one of coc.nvim and nvim lsp
--         vim.lsp.buf.hover()
--     end
-- end)

local lspconfig = require('lspconfig')
lspconfig.racket_langserver.setup{}

local function buffer_augroup(group, bufnr, cmds)
    vim.api.nvim_create_augroup(group, { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    for _, cmd in ipairs(cmds) do
        local event = cmd.event
        cmd.event = nil
        vim.api.nvim_create_autocmd(event, vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
    end
end

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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
        '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca',
        '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
        '<cmd>lua require("telescope.builtin").lsp_references() <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gf',
        '<cmd>lua vim.lsp.buf.format{async=True}<CR>', opts)
    -- Highlight symbols under the cursor
    if client.server_capabilities.document_highlight then
        vim.cmd [[
      hi! LspReferenceRead guibg=#1d3b53
      hi! LspReferenceText guibg=#1d3b53
      hi! LspReferenceWrite guibg=#1d3b53
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
    end

    local detach = function()
        vim.lsp.buf_detach_client(bufnr, client.id)
    end
    buffer_augroup("entropitor:lsp:closing", bufnr, {
        { event = "BufDelete", callback = detach },
    })
end

--Cosmetics of LSP
vim.diagnostic.config({
    virtual_text = false,
    underline = false,
    --underline = {
    ---- do not underline text when severity is low (info or hint).
    --severity = {min = vim.diagnostic.severity.warn}
    --},
    float = {
        source = 'always',
        --focusable = false, -- See neovim#16425
        border = 'single',
    }
})

vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon,
        texthl = hl,
        --numhl = hl
    })
end

------------------------------------------------------------------------
--                           LSP INSTALLER                            --
------------------------------------------------------------------------

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { 'sumneko_lua', 'pyright', 'vimls', 'yamlls', 'jsonls' },
})
require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    ['pyright'] = function()
        lspconfig.pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                -- cmd = os.getenv("CONDA_PREFIX")..'/bin/python',
                python = { analysis = { typeCheckingMode = "off" } }
            },
            -- handlers = {
            --     ['textDocument/publishDiagnostics'] = function(...) end
            -- }
        }
    end
}

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- Python
        -- null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.flake8
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.luaformat,
        -- null_ls.builtins.formatting.prettier,
    },
    on_attach = require "lsp-format".on_attach
    -- function()
    -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
    -- require "lsp-format".on_attach
    -- end,
})
--function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--bufnr = bufnr or 0
--line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--opts = opts or {['lnum'] = line_nr}

--local line_diagnostics = vim.diagnostic.get(bufnr, opts)
--if vim.tbl_isempty(line_diagnostics) then return end

--local diagnostic_message = ""
--for i, diagnostic in ipairs(line_diagnostics) do
--diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
--print(diagnostic_message)
--if i ~= #line_diagnostics then
--diagnostic_message = diagnostic_message .. "\n"
--end
--end
--vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
--end

--vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
