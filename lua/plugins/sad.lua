local status_ok, sad = pcall(require, "sad")
if not status_ok then
  print("sad failing")
end

sad.setup({
  diff = "delta", -- `diff` or `diff-so-fancy`
  ls_file = "fd",
  exact = true, -- exact match
  vsplit = false, -- split sad window the screen vertically
  height_ratio = 1.0, -- height ratio of window when split horizontally
  width_ratio = 1.0, -- height ratio of window when split vertically
})
