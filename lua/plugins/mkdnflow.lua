local status_ok, mkdnflow = pcall(require, "mkdnflow")
if not status_ok then
  print("mkdnflow not working")
end

mkdnflow.setup({
  to_do = {
    symbols = { " ", "X" },
  },
})
