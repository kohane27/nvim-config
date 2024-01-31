return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  build = ":TSUpdate html",
  opts = {
    lang = "javascript",
  },
  config = function(_, opts)
    require("leetcode").setup(opts)
  end,
}
