local status_ok, oil = pcall(require, "oil")
if not status_ok then
  print("oil not working")
end

oil.setup({
  default_file_explorer = true,
  -- See :help oil-columns
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  -- Buffer-local options
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = true,
  -- Skip the confirmation popup for simple operations
  skip_confirm_for_simple_edits = true,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- set to false to disable cleanup
  -- Note: the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 1000,

  use_default_keymaps = false,
  -- See :help oil-actions for a list of all available actions
  -- Set to `false` to remove a keymap
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-w>v"] = "actions.select_vsplit",
    ["<C-w>s"] = "actions.select_split",
    ["<C-w>t"] = "actions.select_tab",
    ["<C-q>"] = "actions.close",
    ["<leader>gf"] = "actions.close",
    ["<C-r>"] = "actions.refresh",
    ["<C-h>"] = "actions.parent",
    ["<C-c>"] = "actions.open_cwd",
    ["L"] = "actions.cd",
    ["~"] = false,
    ["gs"] = "actions.change_sort",
    -- doesn't work in a floating window
    ["<C-p>"] = false,
    ["gx"] = false,
    ["g."] = false,
    ["g\\"] = "actions.toggle_trash",
  },
  view_options = {
    show_hidden = true,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  -- floating window in oil.open_float
  float = {
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    -- config passed to `nvim_open_win` to customize the layout
    override = function(conf)
      conf.anchor = "NW"
      conf.relative = "editor"
      conf.width = math.floor(vim.o.columns * 0.2) -- 20% of total width
      conf.height = vim.o.lines - 5 -- almost full height
      -- top-left corner of the editor grid
      conf.row = 0
      conf.col = 0
      return conf
    end,
  },
  -- Configuration for the actions floating preview window
  preview = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
  },
})
