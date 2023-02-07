local status_ok, trailblazer = pcall(require, "trailblazer")
if not status_ok then
  print("trailblazer not working")
end

trailblazer.setup({
  force_mappings = nil,
  auto_save_trailblazer_state_on_exit = false,
  auto_load_trailblazer_state_on_enter = false, -- experimental
  custom_session_storage_dir = "", -- i.e. "~/trail_blazer_sessions/"
  trail_options = {
    available_trail_mark_modes = { "global_chron" },
    current_trail_mark_mode = "global_chron",
    current_trail_mark_list_type = "quickfix",
    -- verbose_trail_mark_select = true, -- print current mode notification on mode change
    -- mark_symbol = "•", --  will only be used if trail_mark_symbol_line_indicators_enabled = true
    trail_mark_symbol_line_indicators_enabled = false, -- show indicators for all trail marks in symbol column
    newest_mark_symbol = "⬤",
    cursor_mark_symbol = "⬤",
    next_mark_symbol = "⬤",
    previous_mark_symbol = "⬤",
    multiple_mark_symbol_counters_enabled = true,
    number_line_color_enabled = true,
    trail_mark_in_text_highlights_enabled = false, -- highlight character
    symbol_line_enabled = true,
  },
  hl_groups = {
    TrailBlazerTrailMark = {
      guifg = "White",
      guibg = "none",
      gui = "bold",
    },
    TrailBlazerTrailMarkNext = {
      guifg = "Green",
      guibg = "none",
      gui = "bold",
    },
    TrailBlazerTrailMarkPrevious = {
      guifg = "#C34043",
      guibg = "none",
      gui = "bold",
    },
    TrailBlazerTrailMarkCursor = {
      guifg = "Black",
      guibg = "Orange",
      gui = "bold",
    },
    TrailBlazerTrailMarkNewest = {
      guifg = "Black",
      guibg = "LightBlue",
      gui = "bold",
    },
    TrailBlazerTrailMarkGlobalChron = {
      guifg = "Black",
      guibg = "#C34043",
      gui = "bold",
    },
    TrailBlazerTrailMarkBufferLocalChron = {
      guifg = "Black",
      guibg = "Green",
      gui = "bold",
    },
    TrailBlazerTrailMarkBufferLocalLineSorted = {
      guifg = "Black",
      guibg = "LightGreen",
      gui = "bold",
    },
  },
})
