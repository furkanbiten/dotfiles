return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = function()
            return {
                style = "moon",
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                -- light_style = "moon",
                -- transparent = true,
                -- styles = {
                --   sidebars = "transparent",
                --   floats = "transparent",
                -- },
                on_highlights = function(hl, c)
                    do
                        return
                    end
                    local prompt = "#2d3149"
                    hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg }
                    hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
                    hl.TelescopePromptNormal = { bg = prompt }
                    hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
                    hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
                    hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
                    hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
                end,
            }
        end,
    },
    { "bluz71/vim-nightfly-guicolors" }
}
