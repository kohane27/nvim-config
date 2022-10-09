local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  return
end

tmux.setup({
  copy_sync = {
    -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
    -- clipboard by tmux
    redirect_to_clipboard = true,
  },
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
