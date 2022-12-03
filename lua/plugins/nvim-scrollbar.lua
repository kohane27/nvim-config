local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
  return
end

local gitsigns_status_ok, scrollbar_gitsigns = pcall(require, "scrollbar.handlers.gitsigns")
if not gitsigns_status_ok then
  return
end

local search_status_ok, scrollbar_search = pcall(require, "scrollbar.handlers.search")
if not search_status_ok then
  return
end

local colors = require("tokyonight.colors").setup()

scrollbar.setup({
  handle = {
    color = colors.bg_highlight,
  },
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.error },
    Warn = { color = colors.warning },
    Info = { color = colors.info },
    Hint = { color = colors.hint },
    Misc = { color = colors.purple },
  },
})

scrollbar_search.setup({})
scrollbar_gitsigns.setup()
