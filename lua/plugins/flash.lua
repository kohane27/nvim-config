local status_ok, flash = pcall(require, "flash")
if not status_ok then
  print("flash not working")
end

flash.setup({
  labels = "asdfghjklqwertyuiopzxcvbnm",
  highlight = {
    -- show a backdrop
    backdrop = false,
    -- Highlight the search matches
    matches = true,
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
      label = { before = true, after = false, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
  },
})

-- consistent with `leap.nvim`
vim.cmd("highlight FlashLabel guifg=#000000 guibg=#CCFF88 gui=bold,nocombine")
