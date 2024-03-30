return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  build = ":TSUpdate html",
  opts = {
    lang = "javascript",
  },
  config = function(_, opts)
    require("leetcode").setup(opts)
  end,
}
