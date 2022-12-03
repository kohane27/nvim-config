local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  print("saga failing")
end

saga.init_lsp_saga({
  border_style = "rounded",
  code_action_lightbulb = {
    enable = false,
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
})
