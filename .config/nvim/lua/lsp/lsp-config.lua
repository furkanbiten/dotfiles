local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- vim.keymap.set('n', 'K', function()
--     local winid = require('ufo').peekFoldedLinesUnderCursor()
--     if not winid then
--         -- choose one of coc.nvim and nvim lsp
--         vim.lsp.buf.hover()
--     end
-- end)

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
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gf", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)

    -- Highlight symbols under the cursor
    -- if client.server_capabilities.document_highlight then
    -- vim.cmd("hi LspReferenceRead gui=none cterm=none guibg=#525252")
    -- vim.cmd("hi LspReferenceText gui=none cterm=none guibg=#525252")
    -- vim.cmd("hi LspReferenceWrite gui=none cterm=none guibg=#525252")
    -- vim.cmd("autocmd CursorHold   * lua vim.lsp.buf.document_highlight()")
    -- vim.cmd([[autocmd CursorHold   * lua vim.lsp.buf.document_highlight()]])
    -- vim.cmd([[autocmd CursorHoldI  * lua vim.lsp.buf.document_highlight()]])
    -- vim.cmd([[augroup highlight_cmds
    --                 autocmd!
    --                 autocmd ColorScheme * highlight LspReferenceRead guibg=#531d48
    --                 autocmd ColorScheme * highlight LspReferenceText guibg=#531d48
    --                 autocmd ColorScheme * highlight LspReferenceWrite guibg=#531d48
    --               augroup end]])
    -- vim.cmd([[autocmd CursorHold   * lua vim.lsp.buf.document_highlight()]])
    -- vim.cmd([[autocmd CursorHoldI  * lua vim.lsp.buf.document_highlight()]])
    -- vim.cmd([[autocmd CursorMoved  * lua vim.lsp.buf.clear_references()]])
    -- vim.cmd([[autocmd CursorMovedI * lua vim.lsp.buf.clear_references()]])

    -- vim.cmd([[
    --      " hi! LspReferenceRead guibg=#1d3b53
    --      " hi! LspReferenceText guibg=#1d3b53
    --      " hi! LspReferenceWrite guibg=#1d3b53
    --      augroup lsp_document_highlight
    --        autocmd! * <buffer> highlight guibg=#1d3b53
    --        autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --        autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --      augroup END
    --    ]])
    -- end

    local detach = function()
        vim.lsp.buf_detach_client(bufnr, client.id)
    end
    buffer_augroup("entropitor:lsp:closing", bufnr, {
        { event = "BufDelete", callback = detach },
    })
    -- if client.server_capabilities.document_formatting then
    --     -- vim.api.nvim_create_autocmd("BufWritePost",
    --     --     { command = "lua vim.lsp.buf.format({async=true})" })
    --     -- vim.api.nvim_command([[augroup Format
    --     -- autocmd! * <buffer>
    --     -- autocmd BufWritePost <buffer> lua vim.lsp.buf.format()
    --     -- augroup END]])
    --     vim.api.nvim_command([[augroup Format]])
    --     vim.api.nvim_command([[autocmd! * <buffer>]])
    --     vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]])
    --     vim.api.nvim_command([[augroup END]])
    -- end
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
        source = "always",
        --focusable = false, -- See neovim#16425
        border = "single",
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
    end,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        --numhl = hl
    })
end

require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
        ["pyright"] = function()
        require("lspconfig").pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                -- cmd = os.getenv("CONDA_PREFIX")..'/bin/python',
                python = { analysis = { typeCheckingMode = "off" } },
            },
            -- handlers = {
            --     ['textDocument/publishDiagnostics'] = function(...) end
            -- }
        })
    end,
})

local black = require("efm/black")
local isort = require("efm/isort")
local flake8 = require("efm/flake8")
local misspell = require("efm/misspell")
local languages = {
        ["="] = { misspell },
    -- vim = { vint },
    -- lua = { stylua, luacheck },
    python = { black, isort, flake8 },
}
require("lspconfig").efm.setup({
    capabilities = capabilities,
    cmd = { "/home/abiten/go/bin/efm-langserver" },
    on_attach = on_attach,
    init_options = { documentFormatting = true },
    root_dir = vim.loop.cwd,
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { ".git/" },
        lintDebounce = 100,
        -- logLevel = 5,
        languages = languages,
    },
})
-- https://github.com/redhat-developer/yaml-language-server
require("lspconfig").yamlls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://kubernetesjsonschema.dev/v1.10.3-standalone/service-v1.json"] = "*service.yaml",
                ["https://kubernetesjsonschema.dev/v1.14.0/deployment-apps-v1.json"] = "*deployment.yaml",
                ["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
            },
        },
    },
}
