local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
  -- leave it empty to use the default settings
})

vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99
vim.wo.foldenable = true

vim.cmd([[
hi default link UfoFoldedEllipsis Comment
]])
