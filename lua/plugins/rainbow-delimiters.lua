return {
  "hiphish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = require("rainbow-delimiters").strategy["global"],
        vim = require("rainbow-delimiters").strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
