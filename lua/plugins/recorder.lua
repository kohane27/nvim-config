return {
  -- "smjonas/live-command.nvim",
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    -- The first register is the default register/macro-slot used after startup.
    slots = { "q", "r" },
    mapping = {
      startStopRecording = "gq",
      playMacro = "@",
      switchSlot = "<leader>MMWUA",
      editMacro = "<leader>MMWUB",
      deleteAllMacros = "<leader>MMWUC",
      yankMacro = "<leader>MMWUD",
    },
    -- clears all macros-slots on startup
    clear = true,
  },
  config = function(_, opts)
    require("recorder").setup(opts)
  end,
}
