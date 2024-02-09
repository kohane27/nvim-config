return {
  "olimorris/persisted.nvim",
  lazy = false,
  config = function()
    require("persisted").setup({
      silent = false, -- silent nvim message when sourcing session file
      autoload = true, -- automatically load the session for the cwd on Neovim startup
      follow_cwd = false, -- change session file name to match current working directory if it changes
      ignored_dirs = {
        { "/", exact = true },
        { "~/", exact = true },
        { "~/Downloads", exact = true },
      },
    })
  end,
}
