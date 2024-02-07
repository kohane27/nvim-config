-- "smjonas/live-command.nvim",
return {
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    -- Named registers where macros are saved. The first register is the default
    -- register/macro-slot used after startup.
    slots = { "a", "b" },
    mapping = {
      -- TODO: legendary: <leader>rx?
      startStopRecording = "qs",
      playMacro = "qr",
    },
    -- clears all macros-slots on startup
    clear = true,
  },
  config = function(_, opts)
    require("recorder").setup(opts)
  end,
}
