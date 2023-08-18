local status_ok, registers = pcall(require, "registers")
if not status_ok then
  print("registers not working")
end

registers.setup({
  -- Show a line at the bottom with registers that aren't filled
  show_empty = false,
  -- Show registers in this order
  show = '+"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz:',
  bind_keys = {
    -- Show the window when pressing " in normal mode, applying the selected register as part of a motion
    normal = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing " in visual mode, applying the selected register as part of a motion
    visual = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing <C-R> in insert mode, inserting the selected register
    insert = registers.show_window({ mode = "insert" }),

    -- Move the cursor in the registers window down
    ctrl_n = registers.move_cursor_down(),
    -- Move the cursor in the registers window up
    ctrl_p = registers.move_cursor_up(),
    -- Clear the register of the highlighted line when pressing <DEL>
    delete = registers.clear_highlighted_register(),
  },
  symbols = {
    -- The character to show when a register will be applied in a char-wise fashion
    register_type_charwise = "",
    -- The character to show when a register will be applied in a line-wise fashion
    register_type_linewise = "",
    -- The character to show when a register will be applied in a block-wise fashion
    register_type_blockwise = "",
  },
  window = {
    border = "rounded",
    transparency = 10,
  },
})
