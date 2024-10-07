return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  enabled = not vim.g.started_by_firenvim,

  dependencies = { "nvimtools/hydra.nvim" },
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      "<C-n>",
      mode = { "n", "v" },
      "<cmd>MCstart<CR>",
      desc = "Create a selection for selected text or word under cursor",
    },
    {
      "<leader>mulABCD",
      mode = { "n" },
      "<cmd>MCunderCursor<CR>",
      desc = "Select the char under the cursor and start listening for the actions",
    },
    {
      "<leader>mulABC",
      mode = { "n" },
      "<cmd>MCpattern<CR>",
      desc = "Prompts for a pattern and selects every match",
    },
  },
  config = function()
    local N = require("multicursors.normal_mode")
    -- local I = require("multicursors.insert_mode")
    -- local E = require("multicursors.extend_mode")
    require("multicursors").setup({
      hint_config = {
        float_opts = { border = "rounded" },
        position = "bottom-right",
      },
      generate_hints = { config = { column_count = 1, max_hint_length = 30 } },
      normal_keys = {
        -- ["<C-a>"] = { method = false },
        -- ["ga"] = { method = N.find_all_matches, opts = { desc = "Find all" } },
        ["r"] = { method = false }, -- because it uses 0 register
        ["gu"] = { method = false },
        ["gU"] = { method = false },
        ["Z"] = { method = false },
        ["z"] = { method = false },
        ["@"] = { method = false },
      },
      insert_keys = {
        ["<C-c>"] = { method = false },
        ["<C-BS>"] = { method = false },
        ["<C-Right>"] = { method = false },
        ["<C-Left>"] = { method = false },
        ["<End>"] = { method = false },
        ["<Home>"] = { method = false },
      },
      extend_keys = {
        ["O"] = { method = false },
        ["r"] = { method = false },
        ["t"] = { method = false },
        ["y"] = { method = false },
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
