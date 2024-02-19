return {
  -- "smjonas/live-command.nvim",
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    -- The first register is the default register/macro-slot used after startup.
    slots = { "a", "b" },
    mapping = {
      startStopRecording = "Q",
      playMacro = "@",
    },
    -- clears all macros-slots on startup
    clear = true,
  },
  config = function(_, opts)
    require("recorder").setup(opts)
  end,
}
