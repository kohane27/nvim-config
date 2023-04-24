local status_ok, find_extender = pcall(require, "find-extender")
if not status_ok then
  print("find_extender not working find find ")
end

find_extender.setup({
  movments = {
    min_matches = 2,
    highlight_match = { fg = "#000000", bg = "#CCFF88" },
    lh = {
      enable = false,
    },
    leap = {
      enable = true,
      symbols = "hjkl;",
    },
  },
})
