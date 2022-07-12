local status_ok, telekasten = pcall(require, "telekasten")
if not status_ok then
  return
end

telekasten.setup({})
