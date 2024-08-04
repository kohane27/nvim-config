return {
  "chrisbra/csv.vim",
  event = "VeryLazy",
  ft = { "csv", "dat" },
  config = function()
    vim.cmd([[ let g:no_plugin_maps = 1 ]])
  end,
}
