return {
  "dhruvasagar/vim-table-mode",
  event = "VeryLazy",
  ft = "markdown",
  init = function()
    vim.g.table_mode_disable_mappings = 0
    vim.g.table_mode_disable_tableize_mappings = 1
  end,
}
