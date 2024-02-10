return {
  "olimorris/persisted.nvim",
  lazy = false,
  config = function()
    require("persisted").setup({
      autoload = true, -- automatically load the session for the cwd on Neovim startup
      follow_cwd = false, -- change session file name to match current working directory if it changes
    })
  end,
}
