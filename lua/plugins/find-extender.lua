local status_ok, find_extender = pcall(require, "find-extender")
if not status_ok then
  print("find_extender not working")
end

find_extender.setup({
  movments = {
    min_matches = 2,
    highlight_match = { fg = "#c0caf5", bg = "#545c7e" },
    lh = {
      enable = false,
      cursor_hl = { fg = "#545c7e", bg = "#ff9e64" },
    },
    leap = {
      enable = true,
      symbols = "hjkl;",
    },
  },
})
