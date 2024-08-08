return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = { "nvimtools/hydra.nvim" },
  opts = {},
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "n", "v" },
      "<C-n>",
      "<cmd>MCstart<CR>",
      desc = "Create a selection for selected text or word under the cursor",
    },
  },
  config = function()
    local N = require("multicursors.normal_mode")
    -- local I = require("multicursors.insert_mode")
    -- local E = require("multicursors.extend_mode")
    require("multicursors").setup({
      hint_config = {
        float_opts = {
          border = "rounded",
        },
        position = "bottom-right",
      },
      generate_hints = {
        config = {
          column_count = 1,
        },
      },
      normal_keys = {
        ["ga"] = { method = N.find_all_matches, opts = { desc = "Find all" } },
      },

      -- lightpurple1 from vim-visual-multi

      -- Multicursor selections
      vim.api.nvim_set_hl(0, "MultiCursor", {
        ctermbg = 146,
        ctermfg = 235,
        bg = "#afafdf",
        fg = "#262626",
      }),

      -- Main selection in which multicursor began
      vim.api.nvim_set_hl(0, "MultiCursorMain", {
        ctermbg = 146,
        ctermfg = 235,
        bg = "#afafdf",
        fg = "#262626",
      }),
    })
  end,
}
