local status_ok, trailblazer = pcall(require, "trailblazer")
if not status_ok then
  print("trailblazer not working")
end

trailblazer.setup({
  auto_save_trailblazer_state_on_exit = false,
  auto_load_trailblazer_state_on_enter = false, -- experimental
  custom_session_storage_dir = "", -- i.e. "~/trail_blazer_sessions/"
  trail_options = {
    -- Available modes to cycle through. Remove any you don't need.
    available_trail_mark_modes = {
      "global_chron",
      "global_buf_line_sorted",
      "global_chron_buf_line_sorted",
      "global_chron_buf_switch_group_chron",
      "global_chron_buf_switch_group_line_sorted",
      "buffer_local_chron",
      "buffer_local_line_sorted",
    },
    -- The current / initially selected trail mark selection mode. Choose from one of the
    -- available modes: global_chron, global_buf_line_sorted, global_chron_buf_line_sorted,
    -- global_chron_buf_switch_group_chron, global_chron_buf_switch_group_line_sorted,
    -- buffer_local_chron, buffer_local_line_sorted
    current_trail_mark_mode = "global_chron",
    current_trail_mark_list_type = "quickfix", -- currently only quickfix lists are supported
    verbose_trail_mark_select = true, -- print current mode notification on mode change
    mark_symbol = "•", --  will only be used if trail_mark_symbol_line_indicators_enabled = true
    newest_mark_symbol = "⬤", -- disable this mark symbol by setting its value to ""
    cursor_mark_symbol = "⬤", -- disable this mark symbol by setting its value to ""
    next_mark_symbol = "⬤", -- disable this mark symbol by setting its value to ""
    previous_mark_symbol = "⬤", -- disable this mark symbol by setting its value to ""
    multiple_mark_symbol_counters_enabled = true,
    number_line_color_enabled = true,
    trail_mark_in_text_highlights_enabled = true,
    trail_mark_symbol_line_indicators_enabled = false, -- show indicators for all trail marks in symbol column
    symbol_line_enabled = true,
    default_trail_mark_stacks = {
      -- this is the list of trail mark stacks that will be created by default. Add as many
      -- as you like to this list. You can always create new ones in Neovim by using either
      -- `:TrailBlazerSwitchTrailMarkStack <name>` or `:TrailBlazerAddTrailMarkStack <name>`
      "default", -- , "stack_2", ...
    },
    available_trail_mark_stack_sort_modes = {
      "alpha_asc", -- alphabetical ascending
      "alpha_dsc", -- alphabetical descending
      "chron_asc", -- chronological ascending
      "chron_dsc", -- chronological descending
    },
    -- The current / initially selected trail mark stack sort mode. Choose from one of the
    -- available modes: alpha_asc, alpha_dsc, chron_asc, chron_dsc
    current_trail_mark_stack_sort_mode = "alpha_asc",
  },
  mappings = { -- rename this to "force_mappings" to completely override default mappings and not merge with them
    n = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
      motions = {
        new_trail_mark = nil,
        track_back = nil,
        peek_move_next_down = nil,
        peek_move_previous_up = nil,
        toggle_trail_mark_list = nil,
      },
      actions = {
        delete_all_trail_marks = nil,
        paste_at_last_trail_mark = nil,
        paste_at_all_trail_marks = nil,
        set_trail_mark_select_mode = nil,
        switch_to_next_trail_mark_stack = nil,
        switch_to_previous_trail_mark_stack = nil,
        set_trail_mark_stack_sort_mode = nil,
      },
    },
  },
})
