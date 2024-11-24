return {
  "liangxianzhe/nap.nvim",
  event = "VeryLazy",
  -- stylua: ignore
  opts = {
    next_prefix = ";",
    prev_prefix = ",",
    next_repeat = "gj",
    prev_repeat = "gk",
    -- exclude from defaults
    exclude_default_operators = {"a", "A", "b", "B", "f", "F", "T", "<C-t>", "s", "z", "<C-l>", "<M-l>", "<C-q>", "<M-q>", "'"},
    operators = {
      ["d"] = {
        next = { rhs = "<cmd>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", opts = { desc = "Next diagnostic" }, },
        prev = { rhs = "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", opts = { desc = "Prev diagnostic" }, },
      },
      ["c"] = {
        next = { rhs = "<cmd>cnext<CR>zz", opts = { desc = "Next quickfix item" } },
        prev = { rhs = "<cmd>cprevious<CR>zz", opts = { desc = "Prev quickfix item" } },
      },
      ["g"] = {
        next = { rhs = "<cmd>Gitsigns next_hunk<CR>", opts = { desc = "git: Next Hunk" } },
        prev = { rhs = "<cmd>Gitsigns prev_hunk<CR>", opts = { desc = "git: Previous Hunk" } },
      },
      ["t"] = {
        next = { rhs = '<cmd>lua require("todo-comments").jump_next()<CR>', opts = { desc = "Next todo comment" }, },
        prev = { rhs = '<cmd>lua require("todo-comments").jump_prev()<CR>', opts = { desc = "Previous todo comment" }, },
      },
      ["e"] = {
        next = { rhs = "g;zz", opts = { desc = "Next changelist item" } },
        prev = { rhs = "g,zz", opts = { desc = "Previous changelist item" } },
      },
      -- ["l"] = {
      --   next = { rhs = "<cmd>lnext<CR>", opts = { desc = "Next loclist item" } },
      --   prev = { rhs = "<cmd>lprevious<CR>", opts = { desc = "Prev loclist item" } },
      -- },
      -- ["m"] = {
      --   next = { rhs = "<Plug>(Marks-next)", opts = { desc = "Next mark" } },
      --   prev = { rhs = "<Plug>(Marks-prev)", opts = { desc = "Previous mark" } },
      -- },
    },
  },
}
