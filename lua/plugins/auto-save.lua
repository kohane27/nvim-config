return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    debounce_delay = 250, -- delay after which a pending save is executed
    noautocmd = true, -- do not trigger formatting
  },
}
