-- stylua: ignore start

-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'qf', 'help', 'man', 'lspinfo'},
  callback = function() vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':close<CR>', { noremap = true, silent = true, buffer = true }) end
})

vim.api.nvim_create_autocmd('BufWinEnter', { pattern = '*', command = 'set formatoptions-=cro' })

-- quickfix buffers are not listed in the buffer list
vim.api.nvim_create_autocmd('FileType', { pattern = 'qf', command = 'set nobuflisted' })

-- Highlight on yank
autocmd("TextYankPost", { callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = "300" }) end })

-- Enable spellcheck
autocmd("FileType", { pattern = { "gitcommit", "text" }, callback = function() vim.opt_local.spell = true end })

-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { pattern = '*/node_modules/*', callback = function() vim.diagnostic.disable(0) end })

-- Show line diagnostics automatically in hover window
-- vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'},
-- { pattern = '*', callback = function() vim.diagnostic.open_float(nil, { focus = false }) end
-- })

-- Clear `jumplist`
vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'clearjumps' })

-- Clear marks
vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'delmarks a-zA-Z0-9' })

-- Auto resize
vim.api.nvim_create_autocmd('VimResized', { pattern = '*', command = 'tabdo wincmd =' })

-- Tmux rename
if vim.fn.exists("$TMUX") == 1 then
  -- local host = vim.fn.hostname()
  -- print("host", host)
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  -- print("cwd", cwd)
  -- local shortened_cwd = string.gsub(cwd, host, "")
  -- print("shortened_cwd", shortened_cwd)
  vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost", "BufNewFile", "BufEnter" }, {
    pattern = "*",
    callback = function() vim.fn.system("tmux rename-window " .. cwd .. "/" .. vim.fn.expand("%:t")) end,
  })
end
-- stylua: ignore end
