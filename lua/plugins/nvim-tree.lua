local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  print("nvim-tree failing")
end

local config_status_ok, _ = pcall(require, "nvim-tree.config")
if not config_status_ok then
  print("nvim-tree.config failing")
end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

-- https://github.com/ibhagwan/fzf-lua/issues/390
-- vim.cmd([[
-- " automatically close the tab when nvim-tree is the last window in the tab
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])

-- disable netrw (note: need it for `gx` to work)
-- vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    custom = { "node_modules", ".cache", ".bin" },
  },
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = true,
      list = {
        { key = "<C-w>v", action = "vsplit" },
        { key = "<C-w>s", action = "split" },
        { key = "<C-w>t", action = "tabnew" }, -- <C-t> to close tree

        { key = "<CR>", action = "preview" },
        { key = { "o" }, action = "edit" },

        { key = "<C-r>", action = "refresh" },
        { key = "a", action = "create" },
        { key = "rn", action = "rename" },
        { key = "rN", action = "full_rename" },
        { key = "h", action = "close_node" },

        {
          key = "J",
          action = "move_down_fast",
          action_cb = function()
            vim.cmd(":normal 5j")
          end,
        },
        {
          key = "K",
          action = "move_up_fast",
          action_cb = function()
            vim.cmd(":normal 5k")
          end,
        },

        { key = "D", action = "trash" },
        { key = "dd", action = "cut" },
        { key = "pp", action = "paste" },
        { key = "yy", action = "copy" },
        { key = "yn", action = "copy_name" },
        { key = "yp", action = "copy_path" },
        { key = "ya", action = "copy_absolute_path" },
        { key = "q", action = "close" },
        { key = "-", action = "dir_up" },
        { key = "?", action = "toggle_help" },

        -- useful to search
        { key = "f", action = "live_filter" },
        { key = "F", action = "clear_live_filter" },

        -- rarely
        { key = "cd", action = "cd" },
        { key = "P", action = "parent_node" },
        { key = "W", action = "collapse_all" },
        { key = "E", action = "expand_all" },
        { key = ".", action = "run_file_command" },
      },
    },
  },
})
