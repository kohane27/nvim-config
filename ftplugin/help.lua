-- https://vim.fandom.com/wiki/Learn_to_use_help
-- Press Enter to jump to the subject (topic) under the cursor.
-- Press Backspace to return from the last jump.
-- Press s to find the next subject, or S to find the previous subject.
-- Press o to find the next option, or O to find the previous option.

local map = require("core.utils").map
local opts = { noremap = true, silent = true, buffer = 0 }

map("n", "<CR>", "<C-]>", opts)
map("n", "<BS>", "<C-T>", opts)
map("n", "o", "/'\\l\\{2,\\}'<CR>", opts)
map("n", "O", "?'\\l\\{2,\\}'<CR>", opts)
map("n", "s", "/\\|\\zs\\S\\+\\ze\\|<CR>", opts)
map("n", "S", "?\\|\\zs\\S\\+\\ze\\|<CR>", opts)

-- ensure the file is only loaded once
vim.b.did_ftplugin = 1
