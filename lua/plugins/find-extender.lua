local status_ok, find_extender = pcall(require, "find-extender")
if not status_ok then
  print("find_extender not working find find")
end

find_extender.setup({
  ignore_case = true,
  movements = {
    min_matches = 1,
    highlight_match = { fg = "#000000", bg = "#CCFF88" },
    lh = {
      enable = false,
      cursor_hl = { fg = "#545c7e", bg = "#ff9e64" },
    },
    leap = {
      enable = true,
      symbols = "asdfghjkl;",
    },
  },
})
