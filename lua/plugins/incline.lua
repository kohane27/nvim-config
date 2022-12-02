local status_ok, incline = pcall(require, "incline")
if not status_ok then
  return
end

incline.setup({
  hide = {
    cursorline = false,
    focused_win = false,
    only_win = true,
  },
})
