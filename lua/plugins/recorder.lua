-- "smjonas/live-command.nvim",
return {
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    -- Named registers where macros are saved. The first register is the default
    -- register/macro-slot used after startup.
    slots = { "a", "b" },
    mapping = {
      -- TODO: legendary: <leader>rx?
      startStopRecording = "r",
      playMacro = "rr",
      editMacro = "re",
    },
    clear = true, -- clears all macros-slots on startup
    dapSharedKeymaps = false, -- experimental, see README
  },
  config = function(_, opts)
    require("recorder").setup(opts)
  end,
}
