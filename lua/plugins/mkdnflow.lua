local status_ok, mkdnflow = pcall(require, "mkdnflow")
if not status_ok then
  print("mkdnflow not working")
end

mkdnflow.setup({
  links = {
    implicit_extension = nil,
    transform_implicit = true,
    transform_explicit = function(text)
      -- TODO fix
      -- [18. Managing State.md](/Courses/React Docs/18. Managing State.md)
      text = text:gsub("<", " ")
      text = text:gsub(">", " ")
      return text
    end,
  },
  to_do = {
    symbols = { " ", "x" },
  },
})
