return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        scope={
            show_start=false,
            -- show_exact_scope=true, 
            show_end=false,
            highlight = { "Function", "Label"},
            include={
                node_type={
                    python={"if_statement", "for_statement", "with_statement", "try_statement"}
                }
            }
        }
    },
}
