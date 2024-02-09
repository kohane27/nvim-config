-- return {
-- TODO: try to make it work with below style; yr2-char
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
