return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
  cmd = { "Browse" },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  config = function()
    require("gx").setup({
      open_browser_app = "xdg-open",
      handlers = {
        plugin = true, -- open plugin links in lua
        github = true, -- open github issues
        brewfile = false, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
      },
    })
  end,
}
