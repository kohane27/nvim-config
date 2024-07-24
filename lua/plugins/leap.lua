return {
  "ggandor/leap.nvim",
  lazy = false,
  opts = {
    safe_labels = {}, -- disable auto-jumping to the first match; doesn't work on one unique target
    max_phase_one_targets = 0, -- first char won't show possible matches
    max_highlighted_traversal_targets = 10,
    labels = "jklasdfghqwertyuiopzxcvbnm/JKLASDFGHQWERTYUIOPZXCVBNM?",
    equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" },
  },

  config = function(_, opts)
    local leap = require("leap")
    leap.setup(opts)

    -- Bidirectional search
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")

    -- Remote operations at a distance
    vim.keymap.set({ "n", "o" }, "r", function()
      require("leap.remote").action()
    end)

    vim.api.nvim_set_hl(0, "LeapLabel", { fg = "#000000", bg = "#CCFF88", bold = true })

    -- -- mark cursor location before jumping
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "LeapEnter",
    --   callback = function()
    --     vim.cmd("normal m'")
    --   end,
    -- })
    -- NOTE: a bit too disorienting to `zz` after jump every time
    -- -- center cursor after jumping
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "LeapLeave",
    --   callback = function()
    --     vim.cmd("normal zz")
    --   end,
    -- })
  end,
}
