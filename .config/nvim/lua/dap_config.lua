local dap = require("dap")
dap.adapters.python = {
    type = "executable",
    command = os.getenv("CONDA_PREFIX") .. "/bin/python",
    args = {"-m", "debugpy.adapter"},
    justMyCode = false
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        justMyCode = false,
        args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
        end,
        pythonPath = os.getenv("CONDA_PREFIX") .. "/bin/python",
        console = "externalTerminal"
    }
}
-- dap.defaults.fallback.external_terminal = {
-- command = '/usr/bin/x-terminal-emulator';
-- args = {'-e'};
-- }

require("dapui").setup({
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25 -- Can be float or integer > 1
            }, -- { id = "breakpoints", size = 0.0 },
            {id = "stacks", size = 0.25}
            -- { id = "watches", size = 0.0 },
        },
        size = 40,
        position = "left" -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = {"repl"},
        size = 20,
        position = "bottom" -- Can be "left", "right", "top", "bottom"
    }
})
require("nvim-dap-virtual-text").setup()

vim.fn.sign_define("DapBreakpoint",
                   {text = "🔴", texthl = "", linehl = "", numhl = ""})

