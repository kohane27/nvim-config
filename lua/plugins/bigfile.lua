local status_ok, bigfile = pcall(require, "bigfile")
if not status_ok then
  print("bigfile not working")
end

bigfile.setup({
  filesize = 5, -- filesize in MiB
  features = { -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "vimopts",
    "filetype",
  },
})
