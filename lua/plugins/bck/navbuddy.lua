return {
  "SmiteshP/nvim-navbuddy",
  event = "VeryLazy",
  config = function(_, opts)
    local actions = require("nvim-navbuddy.actions")
    require("nvim-navbuddy").setup({
      window = {
        size = "90%", -- Or table format example: { height = "40%", width = "100%"}
        position = "50%", -- Or table format example: { row = "100%", col = "0%"}
        sections = {
          left = {
            size = "20%",
            border = nil, -- You can set border style for each section individually as well.
          },
          mid = {
            size = "40%",
            border = nil,
          },
          right = {
            -- No size option for right most section. It fills to
            -- remaining area.
            border = nil,
            preview = "leaf", -- Right section can show previews too.
            -- Options: "leaf", "always" or "never"
          },
        },
      },
      use_default_mappings = false,
      -- If set to false, only mappings set by user are set.
      -- Else, default mappings are used for keys that are not set by user
      mappings = {
        ["<esc>"] = actions.close, -- Close and cursor to original location
        ["q"] = actions.close,

        ["j"] = actions.next_sibling, -- down
        ["k"] = actions.previous_sibling, -- up

        ["h"] = actions.parent, -- Move to left panel
        ["l"] = actions.children, -- Move to right panel
        ["0"] = actions.root, -- Move to first panel

        ["v"] = actions.visual_name, -- Visual selection of name
        ["V"] = actions.visual_scope, -- Visual selection of scope

        ["y"] = actions.yank_name, -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope, -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name, -- Insert at start of name
        ["I"] = actions.insert_scope, -- Insert at start of scope

        ["a"] = actions.append_name, -- Insert at end of name
        ["A"] = actions.append_scope, -- Insert at end of scope

        ["r"] = actions.rename, -- Rename currently focused symbol

        ["d"] = actions.delete, -- Delete scope

        ["f"] = actions.fold_create, -- Create fold of current scope
        ["F"] = actions.fold_delete, -- Delete fold of current scope

        ["c"] = actions.comment, -- Comment out current scope

        ["<enter>"] = actions.select, -- Goto selected symbol
        ["o"] = actions.select,

        ["J"] = actions.move_down, -- Move focused node down
        ["K"] = actions.move_up, -- Move focused node up

        ["t"] = actions.telescope({ -- Fuzzy finder at current level.
          layout_config = { -- All options that can be
            height = 0.60, -- passed to telescope.nvim's
            width = 0.60, -- default can be passed here.
            prompt_position = "top",
            preview_width = 0.50,
          },
          layout_strategy = "horizontal",
        }),
      },
      lsp = {
        auto_attach = true, -- If set to true, you don't need to manually use attach function
        preference = nil, -- list of lsp server names in order of preference
      },
    })
  end,
}
