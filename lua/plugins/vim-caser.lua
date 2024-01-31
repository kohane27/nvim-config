return {
  "arthurxavierx/vim-caser",
  event = "VeryLazy",
  config = function()
    vim.cmd([[
        let g:caser_no_mappings = 1
        let g:caser_prefix = ""
    ]])
  end,
}
