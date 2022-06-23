local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  return
end

tmux.setup({
  navigation = {
    -- C-hjkl
    enable_default_keybindings = false,
    cycle_navigation = false,
  },
  resize = {
    -- A-hjkl
    enable_default_keybindings = false,
  },
})

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<A-h>", '<cmd>lua require("tmux").move_left()<cr>')
map("n", "<A-l>", '<cmd>lua require("tmux").move_right()<cr>')
map("n", "<A-k>", '<cmd>lua require("tmux").move_top()<cr>')
map("n", "<A-j>", '<cmd>lua require("tmux").move_bottom()<cr>')

map("n", "<C-Left>", '<cmd>lua require("tmux").resize_left()<cr>')
map("n", "<C-Right>", '<cmd>lua require("tmux").resize_right()<cr>')
map("n", "<C-Up>", '<cmd>lua require("tmux").resize_top()<cr>')
map("n", "<C-Down>", '<cmd>lua require("tmux").resize_bottom()<cr>')
