local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  print("nightfox failing")
end

nightfox.setup({
  modules = {
    barbar = true,
    cmp = true,
    diagnostic = true,
    gitgutter = true,
    gitsigns = true,
    illuminate = true,
    lsp_saga = true,
    lsp_trouble = true,
    native_lsp = true,
    nvimtree = true,
    symbol_outline = true,
    telescope = true,
    treesitter = true,
    tsrainbow = true,
  },
})
