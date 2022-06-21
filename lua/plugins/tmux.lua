local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  return
end

tmux.setup({
  copy_sync = {
    -- enables copy sync and overwrites all register actions to
    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
    enable = true,
  },
  navigation = {
    -- C-hjkl for normal mode
    enable_default_keybindings = true,
    cycle_navigation = false,
  },
  resize = {
    -- A-hjkl for normal mode
    enable_default_keybindings = true,
  },
})

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map("n", "<A-h>", '<cmd>lua require("tmux").move_left()<cr>')
-- map("n", "<A-l>", '<cmd>lua require("tmux").move_right()<cr>')
-- map("n", "<A-k>", '<cmd>lua require("tmux").move_top()<cr>')
-- map("n", "<A-j>", '<cmd>lua require("tmux").move_bottom()<cr>')
--
-- map("n", "<Left>", '<cmd>lua require("tmux").resize_left()<cr>')
-- map("n", "<Right>", '<cmd>lua require("tmux").resize_right()<cr>')
-- map("n", "<Up>", '<cmd>lua require("tmux").resize_top()<cr>')
-- map("n", "<Down>", '<cmd>lua require("tmux").resize_bottom()<cr>')
