local status_ok, sad = pcall(require, "sad")
if not status_ok then
  print("sad failing")
end

sad.setup({
  diff = "delta", -- you can use `diff`, `diff-so-fancy`
  ls_file = "fd",
  exact = true, -- exact match
  vsplit = true, -- split sad window the screen vertically, when set to number
  -- it is a threadhold when window is larger than the threshold sad will split vertically,
  height_ratio = 0.6, -- height ratio of sad window when split horizontally
  width_ratio = 0.6, -- height ratio of sad window when split vertically
})
