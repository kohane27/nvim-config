-- stylua: ignore start

-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- close the following pattern with `q`
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'qf', 'help', 'man', 'lspinfo'},
  callback = function() vim.api.nvim_set_keymap("n", "q", ":close<CR>", { noremap = true, silent = true }) end
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

-- Clear `jumplist`
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "clearjumps" })

-- Clear marks
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "delmarks a-zA-Z0-9" })

-- clear registers
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    for i = 97, 122 do -- ASCII for 'a' to 'z'
      vim.fn.setreg(string.char(i), "")
    end
    for i = 49, 57 do -- ASCII for '1' to '9' (except 48 which is '0')
      vim.fn.setreg(string.char(i), "")
    end
  end,
})
