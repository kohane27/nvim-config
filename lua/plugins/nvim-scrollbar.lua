return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    local colors = require("kanagawa.colors").setup()
    require("scrollbar").setup({
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = true,
      },
      handle = { color = colors.bg_highlight },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
        GitAdd = {
          color = colors.green,
          highlight = "GitSignsAdd",
        },
        GitChange = {
          color = colors.warning,
          highlight = "GitSignsChange",
        },
        GitDelete = {
          color = colors.error,
          highlight = "GitSignsDelete",
        },
      },
    })
    require("scrollbar.handlers.search").setup({})
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
