local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
  -- leave it empty to use the default settings
})

vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true
