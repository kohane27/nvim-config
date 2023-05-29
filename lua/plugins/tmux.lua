local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  print("tmux not working")
end

tmux.setup({
  copy_sync = {
    -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
    -- clipboard by tmux
    redirect_to_clipboard = true,
  },
  navigation = {
    -- A-hjkl
    cycle_navigation = false,
    enable_default_keybindings = false,
  },
  resize = {
    -- C-S-hjkl
    enable_default_keybindings = false,
    -- sets resize steps for x axis
    resize_step_x = 4,
    -- sets resize steps for y axis
    resize_step_y = 4,
  },
})
