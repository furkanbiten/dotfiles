return {
    "okuuva/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            debounce_delay = 2500,     -- saves the file at most every `debounce_delay` milliseconds
            write_all_buffers = false, -- write all buffers when the current one meets `condition`
            -- Disabling the message at each auto save
            execution_message = {
                message = function()
                    return ""
                end,
                dim = 0.18,
                cleaning_interval = 1250,
            },
            condition = function(buf)
                local utils = require "auto-save.utils.data"
                if
                    vim.fn.getbufvar(buf, "&modifiable") == 1 and
                    vim.api.nvim_buf_is_valid(0) and
                    utils.not_in(vim.fn.getbufvar(buf, "&filetype"), { "harpoon", "NvimTree" }) then
                    return true
                end
                return false
            end,
        })
        vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", { silent = true })
    end
}
