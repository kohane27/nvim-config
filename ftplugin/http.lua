local map = require("core.utils").map

map("n", "<CR>", ":lua require('kulala').run()<CR>")

-- -- Disable spellchecking
-- vim.opt_local.spell = false

-- ensure the file is only loaded once
vim.b.did_ftplugin = 1
