local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  print("lspsaga not working")
end

saga.setup({
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = true,
    virtual_text = false,
  },
  code_action = {
    extend_gitsigns = true,
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
    vsplit = "<C-w>v",
    split = "<C-w>s",
    tabe = "<C-w>t",
    quit = { "q", "<ESC>" },
  },
  hover = {
    max_width = 0.9,
    open_link = "gx",
    open_browser = "!firefox",
  },
  ui = {
    title = true,
    border = "rounded", -- single, double, rounded, solid, shadow
    winblend = 0,
  },
  outline = {
    layout = "float",
    max_height = 0.8,
    left_width = 0.3,
    keys = {
      toggle_or_jump = "o",
      quit = "q",
      jump = "e",
    },
  },
})
