vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  print("nvim-tree.config config_status_ok failing")
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.cmd([[

" automatically close the tab when nvim-tree is the last window in the tab
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

]])

nvim_tree.setup({

  -- renderer = {
  --   indent_markers = {
  --     enable = false,
  --     icons = {
  --       corner = "└ ",
  --       edge = "│ ",
  --       none = "  ",
  --     },
  --   },
  -- },
  update_cwd = true,
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

  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  filters = {
    custom = { "node_modules", ".cache", ".bin" },
  },
  view = {
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = true,
      list = {
        -- action = "" means removing default
        { key = "<C-w>v", action = "vsplit" },
        { key = "<C-w>s", action = "split" },
        { key = "t", action = "tabnew" },

        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = { "<CR>", "o", "L" }, action = "edit" },
        { key = { "<C-]>" }, action = "cd" },
        { key = "P", action = "parent_node" },
        { key = "H", action = "close_node" },
        { key = "<Tab>", action = "preview" },

        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "<C-r>", action = "full_rename" },

        { key = "dd", action = "cut" },
        { key = "pp", action = "paste" },
        { key = "c", action = "copy" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "q", action = "close" },
        { key = "?", action = "toggle_help" },
        { key = "W", action = "collapse_all" },
        { key = ".", action = "run_file_command" },
      },
    },
  },
})
