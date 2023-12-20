require("ibl").setup({
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
})
vim.opt.listchars:append("eol: ")
