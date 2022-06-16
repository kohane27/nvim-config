local status_ok, leap = pcall(require, "leap")
if not status_ok then
  print("leap failing")
end

-- true to override conflicts
leap.set_default_keymaps(true)

-- leap.setup {
--  case_insensitive = true,
-- }

function Leap_Bidirectional()
  require("leap").leap({ ["target-windows"] = { vim.api.nvim_get_current_win() } })
end

vim.api.nvim_set_keymap("n", "s", ":lua Leap_Bidirectional()<CR>", { noremap = true, silent = true })
