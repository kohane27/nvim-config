local status_ok, focus = pcall(require, "focus")
if not status_ok then
  return
end

focus.setup({ hybridnumber = true, excluded_filetypes = { "toggleterm" }, autoresize = true })
