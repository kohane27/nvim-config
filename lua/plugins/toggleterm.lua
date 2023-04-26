local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  print("toggleterm not working")
end

toggleterm.setup({
  size = 12,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  start_in_insert = true,
  insert_mappings = true,
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shade_terminals = true,
  shading_factor = 1,
  shade_filetypes = { "none", "fzf" },
  -- float_opts = {
  --   border = "double",
  --   winblend = 0,
  --   highlights = {
  --     border = "Normal",
  --     background = "Normal",
  --   },
  -- },
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0, noremap = true, silent = true }

  -- escape
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-c>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

  -- navigate
  vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)

  -- force close without prompting
  vim.keymap.set("t", "<A-c>", [[<Cmd>q!<CR>]], opts)
  -- vim.keymap.set("t", "<A-c>", [[<C-\><C-n><C-W>c]], opts)
end

--  mappings only for toggleterm
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
