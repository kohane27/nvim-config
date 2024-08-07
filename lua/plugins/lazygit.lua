return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  init = function()
    vim.g.lazygit_floating_window_winblend = 0 -- transparency
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window
    vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

    vim.g.lazygit_use_custom_config_file_path = 1
    vim.g.lazygit_config_file_path = os.getenv("HOME") .. "/.config/lazygit/config.yml"
  end,
}
