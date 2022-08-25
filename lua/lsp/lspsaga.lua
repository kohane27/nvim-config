local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  print("saga failing")
end

saga.init_lsp_saga({
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "rounded",
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = "<C-p>", next = "<C-n>" },
  -- Error, Warn, Info, Hint
  -- diagnostic_header = { " ", " ", " ", "ﴞ " },
  diagnostic_header = { "🙀", "😿", "😾", "😺" },
  -- diagnostic_header = { "😡", "😥", "😤", "😐" },
  show_diagnostic_source = true,
  -- add bracket or something with diagnostic source, just have 2 elements
  diagnostic_source_bracket = {},
  -- use emoji lightbulb in default
  code_action_icon = "💡",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = false,
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 50,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  definition_preview_icon = "  ",
})
