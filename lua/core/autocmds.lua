-- stylua: ignore start

-- local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- close the following pattern with `q`
autocmd('FileType', {
  pattern = {'qf', 'help', 'man', 'lspinfo'},
  callback = function() vim.keymap.set("n", "q", ":close<CR>", { noremap = true, silent = true }) end
})

-- quickfix buffers are not listed in the buffer list
autocmd('FileType', { pattern = 'qf', command = 'set nobuflisted' })

-- Enable spellcheck
autocmd("FileType", { pattern = { "gitcommit", "text" }, callback = function() vim.opt_local.spell = true end })

autocmd('BufWinEnter', { pattern = '*', command = 'set formatoptions-=cro' })

-- Highlight on yank
autocmd("TextYankPost", { callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = "300" }) end })

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({'BufRead', 'BufNewFile'}, { pattern = '*/node_modules/*', callback = function() vim.diagnostic.disable(0) end })

-- Show line diagnostics automatically in hover window
-- autocmd({'CursorHold', 'CursorHoldI'},
-- { pattern = '*', callback = function() vim.diagnostic.open_float(nil, { focus = false }) end
-- })

-- Auto resize
autocmd('VimResized', { pattern = '*', command = 'tabdo wincmd =' })

-- autocmd({ "BufReadPost", "FileReadPost", "BufNewFile", "BufEnter" }, {
--   pattern = "*",
--   callback = function()
--     -- tmux rename
--     if vim.fn.exists("$TMUX") == 1 then
--       local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
--       local filename = vim.fn.expand("%:t")
--       vim.fn.system("tmux rename-window " .. cwd .. "/" .. filename)
--     end
--   end
-- })

-- clear `jumplist`
autocmd("VimEnter", { pattern = "*", command = "clearjumps" })

-- clear marks
autocmd("VimEnter", { pattern = "*", command = "delmarks a-zA-Z0-9" })

-- clear registers
autocmd("VimEnter", {
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

autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"Fastfile", "Gemfile", "Rakefile"},
  callback = function()
    vim.bo.filetype = "ruby"
  end,
  desc = "Set filetype to ruby for Fastfile, Gemfile, and Rakefile"
})

autocmd({ "BufLeave", "VimLeave" }, {
  pattern = "/tmp/qutebrowser-editor-*",
  callback = function(ev)
    -- check if the buffer still exists
    if vim.api.nvim_buf_is_valid(ev.buf) then
      local file_content = vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
      local content = table.concat(file_content, "\n")

      -- ensure clipboard is available
      if vim.fn.has("clipboard") == 1 then
        -- use system clipboard
        vim.fn.setreg("+", content)
        -- synchronize with system clipboard
        vim.cmd("let @* = @+")
      end
    end
  end,
})

-- stylua: ignore end
