local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

-- using ufo provider need remap `zR` and `zM`
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
