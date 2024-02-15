return {
  -- scrollable bar
  "dstein64/nvim-scrollview",
  event = "VeryLazy",
  opts = {
    on_startup = false,
    auto_mouse = true,
    winblend = 0,
    current_only = true,
    excluded_filetypes = { "nvim-tree" },
  },
  config = function(_, opts)
    require("scrollview").setup(opts)
    vim.cmd([[highlight ScrollView cterm=reverse gui=bold,underline guifg=#ebcb8b guibg=#4c566a]])
  end,
}
