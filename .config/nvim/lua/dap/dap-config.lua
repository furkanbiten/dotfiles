local dap = require("dap")
dap.adapters.python = {
	type = "executable",
	command = os.getenv("CONDA_PREFIX") .. "/bin/python",
	args = { "-m", "debugpy.adapter" },
	justMyCode = false,
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
		console = "internalConsole",
	},
}

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
