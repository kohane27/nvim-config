return {
  "smjonas/live-command.nvim",
  config = function()
    require("live-command").setup({
      commands = {
        Norm = { cmd = "norm" },
        G = { cmd = "g" },
        S = { cmd = "s" },
      },
    })
  end,
}
