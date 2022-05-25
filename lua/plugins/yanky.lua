local status_ok, yanky = pcall(require, "yanky")
if not status_ok then
  return
end

yanky.setup({
  -- ring = {
  --   history_length = 10,
  -- },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 300,
  },
})

vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)", {})
vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)", {})
vim.api.nvim_set_keymap("x", "p", "<Plug>(YankyPutAfter)", {})
vim.api.nvim_set_keymap("x", "P", "<Plug>(YankyPutBefore)", {})

-- after performing a paste, you can cycle through the history by hitting <c-n> and <c-p>.
-- Any modifications done after pasting will cancel the possibility to cycle.
-- vim.api.nvim_set_keymap("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
-- vim.api.nvim_set_keymap("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})
-- vim.api.nvim_set_keymap("n", "<leader>n", "<Plug>(YankyCycleForward)", {})
-- vim.api.nvim_set_keymap("n", "<leader>p", "<Plug>(YankyCycleBackward)", {})
