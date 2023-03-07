local status_ok, mkdnflow = pcall(require, "mkdnflow")
if not status_ok then
  print("mkdnflow not working")
end

mkdnflow.setup({
  links = {
    style = "markdown",
    name_is_source = false,
    conceal = false,
    -- context = 1,
  },
  to_do = {
    symbols = { " ", "X" },
  },
})
