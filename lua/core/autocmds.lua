-----------------------------------------------------------
-- Autocommand functions
-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup
-----------------------------------------------------------

vim.cmd([[
" disable auto-indentation for markdown
autocmd filetype markdown set indentexpr=

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _remap_in_todo
    autocmd!
    autocmd BufRead ~/Documents/Obsidian/SecondBrain/TODO_Database.md inoremap <silent> <buffer> td - [ ]  🛫 <c-r>=strftime("%Y-%m-%d")<cr><left><left><left><left><left><left><left><left><left><left><left><left><left>
    autocmd BufRead ~/Documents/Obsidian/SecondBrain/TODO_Database.md inoremap <silent> <buffer> do ✅ <c-r>=strftime("%Y-%m-%d")<cr><Esc>:w<CR>
    autocmd BufRead ~/Documents/Obsidian/SecondBrain/TODO_Database.md inoremap <silent> <buffer> du 📅 <c-r>=strftime("%Y-%m-%d")<cr><Esc>:w<CR>
    autocmd BufRead ~/Documents/Obsidian/SecondBrain/TODO_Database.md inoremap <silent> <buffer> #t #tonight<Esc>:w<CR>
    autocmd BufRead ~/Documents/Obsidian/SecondBrain/TODO_Database.md inoremap <silent> <buffer> #a #atwork<Esc>:w<CR>
    autocmd BufRead ~/Documents/Obsidian/SecondBrain/TODO_Database.md inoremap <silent> <buffer> #o #Obsidian<Esc>:w<CR>
  augroup end
]])

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
-- augroup('YankHighlight', { clear = true })
-- autocmd('TextYankPost', {
--   group = 'YankHighlight',
--   callback = function()
--     vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '300' })
--   end
-- })

-- Enable spellchecking in text and gitcommit files
autocmd("FileType", {
  pattern = { "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })

-- -- File extension specific tabbing
-- autocmd("Filetype", {
--    pattern = "python",
--    callback = function()
--       vim.opt_local.expandtab = true
--       vim.opt_local.tabstop = 4
--       vim.opt_local.shiftwidth = 4
--       vim.opt_local.softtabstop = 4
--    end,
-- })

-- -- Don't auto commenting new lines
-- autocmd('BufEnter', {
--   pattern = '*',
--   command = 'set fo-=c fo-=r fo-=o'
-- })

-- Settings for fyletypes:
-- Disable line lengh marker
-- augroup('setLineLenght', { clear = true })
-- autocmd('Filetype', {
--   group = 'setLineLenght',
--   pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
--   command = 'setlocal cc=0'
-- })

-- Set indentation to 2 spaces
-- augroup('setIndent', { clear = true })
-- autocmd('Filetype', {
--   group = 'setIndent',
--   pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
--     'yaml', 'lua'
--   },
--   command = 'setlocal shiftwidth=2 tabstop=2'
-- })
