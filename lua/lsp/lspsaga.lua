local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  print("saga not working")
end

saga.setup({
  diagnostic = {
    on_insert = false,
  },
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
    title = true,
    border = "rounded", -- single, double, rounded, solid, shadow
    winblend = 0,
  },
})
