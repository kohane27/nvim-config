local status_ok, flash = pcall(require, "flash")
if not status_ok then
  print("flash not working")
end

flash.setup({
  labels = "asdfghjklqwertyuiopzxcvbnm",
  highlight = {
    -- show a backdrop with hl FlashBackdrop
    backdrop = true,
    -- Highlight the search matches
    matches = true,
    -- extmark priority
    priority = 5000,
    groups = {
      match = "FlashMatch",
      current = "FlashCurrent",
      backdrop = "FlashBackdrop",
      label = "FlashLabel",
    },
  },
  modes = {
    -- regular search with `/` or `?`
    search = { enabled = false },
    -- `f`, `F`, `t`, `T`, `;` and `,` motions
    char = { enabled = false },
    -- `require("flash").treesitter()`
    treesitter = {
      labels = "abcdefghijklmnopqrstuvwxyz",
      jump = { pos = "range" },
      search = { incremental = false },
      label = { before = true, after = true, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
    treesitter_search = {
      jump = { pos = "range" },
      search = { multi_window = false, wrap = true, incremental = false },
      remote_op = { restore = false },
      label = { before = true, after = true, style = "inline" },
    },
  },
})
