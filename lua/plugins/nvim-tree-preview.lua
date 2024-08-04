return {
  "b0o/nvim-tree-preview.lua",
  event = "VeryLazy",
  opts = {
    -- Keymaps for the preview window (does not apply to the tree window).
    -- Actions:
    --   { action = 'close', unwatch? = false, focus_tree? = true }
    --   { action = 'toggle_focus' }
    --
    -- Open modes:
    --   { open = 'edit' }
    --   { open = 'tab' }
    --   { open = 'vertical' }
    --   { open = 'horizontal' }
    --
    -- To disable a default keymap, set it to false.
    -- All keymaps are set in normal mode. Other modes are not currently supported.
    keymaps = {
      ["<Esc>"] = { action = "close", unwatch = true },
      ["<Tab>"] = { action = "toggle_focus" },
      ["<CR>"] = { open = "edit" },
      ["<C-w>t"] = { open = "tab" },
      ["<C-w>v"] = { open = "vertical" },
      ["<C-w>s"] = { open = "horizontal" },
    },
    min_width = math.floor(vim.o.columns * 0.7), -- 70% of total width
    min_height = vim.o.lines - 3, -- almost full height
    max_width = math.floor(vim.o.columns * 0.7),
    max_height = vim.o.lines - 3,
    -- col = require("nvim-tree.view").View.width + 1,
  },
}
