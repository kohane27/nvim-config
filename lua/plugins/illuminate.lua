return {
  -- highlighting other uses of the word under cursor
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({})

    local function map(mode, lhs, rhs)
      local options = { noremap = true, silent = true }
      if opts then
        options = vim.tbl_extend("force", options)
      end
      vim.api.nvim_set_keymap("", lhs, rhs, options)
    end

    map("x", "<M-i>", "<Nop>")
    map("o", "<M-i>", "<Nop>")
    map("n", "<M-p>", "<Nop>")
    map("n", "<M-n>", "<Nop>")
  end,
}
