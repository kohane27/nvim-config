local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  return
end

tmux.setup({
  navigation = {
    -- C-hjkl
    enable_default_keybindings = false,
    cycle_navigation = false,
  },
  resize = {
    -- A-hjkl
    enable_default_keybindings = false,
  },
})
