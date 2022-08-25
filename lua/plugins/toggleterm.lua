local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 10,
  open_mapping = [[<leader>tn]],
  hide_numbers = true,
  shade_terminals = false,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shade_filetypes = { "none", "fzf" },
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-c>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<A-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- mappings for only toggle term
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
