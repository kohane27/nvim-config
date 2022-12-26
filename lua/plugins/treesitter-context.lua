local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
  print("treesitter-context failing")
end

context.setup({
  enable = true,
})
