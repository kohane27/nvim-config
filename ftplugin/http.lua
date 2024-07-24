local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<CR>", ":lua require('kulala').run()<CR>", opts)

-- -- Disable spellchecking
-- vim.opt_local.spell = false

-- ensure the file is only loaded once
vim.b.did_ftplugin = 1
