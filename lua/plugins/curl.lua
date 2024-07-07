return {
  "oysandvik94/curl.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- branch = "filetype",
  config = function()
    require("curl").setup({})
  end,
}
