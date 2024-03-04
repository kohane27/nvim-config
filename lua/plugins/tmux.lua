return {
  "aserowy/tmux.nvim",
  -- Only load if tmux is used
  event = function()
    if vim.fn.exists("$TMUX") == 1 then
      return "VeryLazy"
    end
  end,
  opts = {
    copy_sync = {
      -- all yanks (and deletes) will get redirected to system clipboard
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
      resize_step_x = 6,
      -- sets resize steps for y axis
      resize_step_y = 6,
    },
  },
  config = function(_, opts)
    require("tmux").setup(opts)
  end,
}
