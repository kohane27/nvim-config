local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  print("toggleterm not working")
end

toggleterm.setup({
  -- size = 12,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
  direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  -- shade_terminals = true,
  -- shading_factor = 1,
  shade_filetypes = { "none", "fzf", "lspinfo", "mason", "lazy", "qf", "terminal", "dashboard", "spectre-panel" },
  float_opts = {
    border = "rounded",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0, noremap = true, silent = true }

  -- escape
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  -- hide
  vim.keymap.set("t", "<C-t>", [[<Cmd>ToggleTermToggleAll<CR>]], opts)

  -- navigate
  -- vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)

  -- force close without prompting
  -- vim.keymap.set("t", "<C-t>", [[<Cmd>q!<CR>]], opts)
  -- vim.keymap.set("t", "<C-t>", [[<C-\><C-n><C-W>c]], opts)
end

--  mappings only for toggleterm
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
