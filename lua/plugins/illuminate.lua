return {
  -- highlighting other uses of the word under cursor
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({})
  end,
}
