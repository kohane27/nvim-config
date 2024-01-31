return {
  "echasnovski/mini.comment",
  version = false,
  event = "VeryLazy",
  opts = {
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring").calculate_commentstring()
      end,
    },
  },
  config = function()
    require("mini.comment").setup({})
  end,
}
