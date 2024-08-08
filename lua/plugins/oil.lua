return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {
    -- See :help oil-columns
    columns = { "icon" },
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,
    -- Skip the confirmation popup for simple operations
    skip_confirm_for_simple_edits = true,
    -- Triggered by selecting a new/moved/renamed file or directory
    prompt_save_on_select_new_entry = false,
    -- Oil will automatically delete hidden buffers after this delay set to false to disable cleanup
    cleanup_delay_ms = 1000,

    use_default_keymaps = false,
    -- See :help oil-actions for a list of all available actions
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-w>v"] = "actions.select_vsplit",
      ["<C-w>s"] = "actions.select_split",
      ["<C-w>t"] = "actions.select_tab",
      ["<C-q>"] = "actions.close",
      ["-"] = "actions.close",
      ["F"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["<C-h>"] = "actions.parent",
      ["<C-l>"] = "actions.select",
      ["~"] = false,
      ["gs"] = false,
      -- doesn't work in a floating window
      ["<C-p>"] = false,
      ["gx"] = false,
      ["g."] = false,
      ["g\\"] = "actions.toggle_trash",
    },
    view_options = {
      show_hidden = true,
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
  }
}
