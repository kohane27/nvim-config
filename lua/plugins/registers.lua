local status_ok, registers = pcall(require, "registers")
if not status_ok then
  return
end

registers.setup({
  bind_keys = {
    -- Show the window when pressing " in normal mode, applying the selected register as part of a motion
    normal = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing " in visual mode, applying the selected register as part of a motion
    visual = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing <C-R> in insert mode, inserting the selected register
    insert = registers.show_window({ mode = "insert" }),

    -- Move the cursor in the registers window down when pressing <C-N>
    ctrl_n = registers.move_cursor_down(),
    -- Move the cursor in the registers window up when pressing <C-P>
    ctrl_p = registers.move_cursor_up(),
    -- Clear the register of the highlighted line when pressing <DEL>
    delete = registers.clear_highlighted_register(),
  },
})
