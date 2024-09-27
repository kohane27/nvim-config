return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    execution_message = {
      enabled = false,
    },
    debounce_delay = 500, -- delay after which a pending save is executed
    noautocmd = true, -- do not trigger formatting
  },
}
