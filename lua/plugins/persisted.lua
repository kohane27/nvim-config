return {
  "olimorris/persisted.nvim",
  lazy = false,
  opts = {
    -- automatically load the session for the cwd on startup
    autoload = true,
    on_autoload_no_session = function()
      vim.notify("No existing session to load.")
    end,

    -- change session file name to match current working directory if it changes
    follow_cwd = false,

    ignored_dirs = {
      { "/home/" .. vim.fn.hostname(), exact = true },
      { "/", exact = true },
      { "/tmp", exact = true },
    },
  },

  init = function()
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
