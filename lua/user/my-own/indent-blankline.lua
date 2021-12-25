require("indent_blankline").setup {
    -- show_current_context = false,
    -- show_current_context_start = true,
}

vim.api.nvim_exec(
[[
 let g:indent_blankline_filetype_exclude = ['help', 'vim']
]],
true)
