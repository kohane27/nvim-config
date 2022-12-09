-- ╭──────────────────────────────────────────────────────────╮
-- │ Autocommand functions                                    │
-- │ Define autocommands with Lua APIs                        │
-- │ See: h:api-autocmd, h:augroup                            │
-- ╰──────────────────────────────────────────────────────────╯

vim.cmd([[
  " disable auto-indentation
  " autocmd filetype markdown set indentexpr=
  " autocmd fileType markdown setl conceallevel=1

  " format on save except the following
  let ftToIgnore = ['c', 'markdown']
  autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 | lua vim.lsp.buf.format()

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd = 
  " augroup end
]])

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "300" })
  end,
})

-- Enable spellcheck in text and gitcommit files
autocmd("FileType", {
  pattern = { "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- `leap.nvim`: after jumping run `zz`
autocmd("User", {
  pattern = "LeapLeave",
  callback = function()
    vim.cmd("norm zz")
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
