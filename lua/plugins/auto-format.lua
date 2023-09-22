local status_ok, autoformat = pcall(require, "auto-format")
if not status_ok then
  print("auto-format not working")
end

autoformat.setup({
  -- augroup name
  augroup_name = "AutoFormat",

  -- If formatting takes longer than this amount of time, it will fail. Having no
  -- timeout at all tends to be ugly - larger files, complex or poor formatters
  -- will struggle to format within whatever the default timeout
  -- `vim.lsp.buf.format` uses.
  timeout = 4000,

  -- These filetypes will not be formatted automatically.
  exclude_ft = {},

  -- Prefer formatting via LSP for these filetypes.
  prefer_lsp = {},
  -- synchronously format
  async = false,
})
