-- return {
--   "ggandor/leap-spooky.nvim",
--   lazy = false,
--   config = function()
--     require("leap-spooky").setup()
--   end,
-- }

return {
  "rasulomaroff/telepath.nvim",
  lazy = false,
  config = function()
    require("telepath").use_default_mappings({ keys = { "r" } })
  end,
}
