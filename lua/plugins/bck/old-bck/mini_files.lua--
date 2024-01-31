local status_ok, mini_files = pcall(require, "mini.files")
if not status_ok then
  print("mini_files not working")
end

mini_files.setup({
  -- Customization of shown content
  content = {
    -- Predicate for which file system entries to show
    filter = nil,
    -- What prefix to show to the left of file system entry
    prefix = nil,
    -- In which order to show file system entries
    sort = nil,
  },

  -- Module mappings created only inside explorer.
  -- Use `''` (empty string) to not create one.
  mappings = {
    close = "<C-q>",
    go_in = "<CR>",
    go_in_plus = "L",
    go_out = "<BS>",
    go_out_plus = "H",
    reset = "<C-l>",
    reveal_cwd = "@",
    show_help = "g?",
    synchronize = "<C-s>",
    trim_left = "<",
    trim_right = ">",
  },

  options = {
    -- Whether to delete permanently or move into module-specific trash
    permanent_delete = false,
    -- Whether to use for editing directories
    use_as_default_explorer = true,
  },

  -- Customization of explorer windows
  windows = {
    -- Maximum number of windows to show side by side
    max_number = math.huge,
    -- Whether to show preview of file/directory under cursor
    preview = false,
    -- Width of focused window
    width_focus = 50,
    -- Width of non-focused window
    width_nofocus = 15,
    -- Width of preview window
    width_preview = 25,
  },
})
