local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  print("tmux failing")
end

tmux.setup({
  copy_sync = {
    -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
    -- clipboard by tmux
    redirect_to_clipboard = true,
  },
  navigation = {
    -- C-hjkl
    cycle_navigation = false,
    enable_default_keybindings = false,
  },
  resize = {
    -- A-hjkl
    enable_default_keybindings = false,
    -- sets resize steps for x axis
    resize_step_x = 1,
    -- sets resize steps for y axis
    resize_step_y = 1,
  },
})
