return {
  -- highlighting other uses of the word under cursor
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({})

    local map = require("core.utils").map
    map("x", "<M-i>", "<Nop>")
    map("o", "<M-i>", "<Nop>")
    map("n", "<M-p>", "<Nop>")
    map("n", "<M-n>", "<Nop>")
  end,
}
