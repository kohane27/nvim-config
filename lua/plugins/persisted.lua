return {
  "olimorris/persisted.nvim",
  lazy = false,
  enabled = not vim.g.started_by_firenvim,
  config = function()
    require("persisted").setup({
      autoload = true, -- automatically load the session for the cwd on Neovim startup
      follow_cwd = false, -- change session file name to match current working directory if it changes
    })

    -- close nvim-tree before saving
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "PersistedSavePre",
      group = vim.api.nvim_create_augroup("PersistedHooks", {}),
      callback = function()
        vim.cmd("NvimTreeClose")
      end,
    })
  end,
}
