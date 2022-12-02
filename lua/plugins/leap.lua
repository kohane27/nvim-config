local status_ok, leap = pcall(require, "leap")
if not status_ok then
  print("leap failing")
end

-- true to override conflicts
leap.set_default_keymaps(true)

leap.setup({
  case_sensitive = false,
  -- disable auto-jumping to the first match
  safe_labels = {},
})

-- Bidirectional search
local function leap_current_window()
  leap.leap({ target_windows = { vim.fn.win_getid() } })
end
vim.keymap.set("n", "s", leap_current_window, { silent = true })
vim.keymap.set("x", "s", leap_current_window, { silent = true })
