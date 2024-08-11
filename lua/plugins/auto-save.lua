return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    execution_message = {
      enabled = false,
    },
    noautocmd = true, -- do not trigger formatting
  },
}
