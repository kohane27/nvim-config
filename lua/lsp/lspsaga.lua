local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  print("saga not working")
end

saga.setup({
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = true,
    virtual_text = false,
  },
  symbol_in_winbar = {
    enable = true,
    in_custom = false, -- else won't work
    separator = " ",
    show_file = false,
    click_support = false,
  },
  finder = {
    open = { "o", "<CR>" },
    vsplit = "<C-v>",
    split = "<C-s>",
    tabe = "<C-t>",
    quit = { "q", "<ESC>" },
  },
  ui = {
    -- currently only round theme
    theme = "round",
    title = true,
    -- single, double, rounded, solid, shadow
    border = "rounded",
    winblend = 0,
    colors = {
      --float window normal background color
      normal_bg = "#16161D",
      --title background color
      title_bg = "#afd700",
      red = "#C34043",
      magenta = "#b33076",
      orange = "#FFA066",
      yellow = "#DCA561",
      green = "#76946A",
      cyan = "#9CABCA",
      blue = "#7E9CD8",
      purple = "#CBA6F7",
      white = "#727169",
      black = "#16161D",
    },
  },
})
