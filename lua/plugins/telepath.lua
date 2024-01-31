-- "ggandor/leap-spooky.nvim",
return {
  "rasulomaroff/telepath.nvim",
  event = "VeryLazy",
  config = function()
    require("telepath").use_default_mappings({ keys = { "r" } })
  end,
}
