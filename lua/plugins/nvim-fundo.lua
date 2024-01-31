return {
  "kevinhwang91/nvim-fundo",
  event = "VeryLazy",
  dependencies = "kevinhwang91/promise-async",
  build = function()
    require("fundo").install()
  end,
  config = function()
    require("fundo").setup()
  end,
}
