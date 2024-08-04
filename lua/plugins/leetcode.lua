return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  build = ":TSUpdate html",
  opts = { lang = "javascript" },
  -- stylua: ignore
  keys = {
    { "<leader>MXlem", "<cmd>Leet Menu<CR>",    desc = "LeetCode: Opens Menu Dashboard" },
    { "<leader>MXlec", "<cmd>Leet console<CR>", desc = "LeetCode: Opens Console For Currently Opened Question" },
    { "<leader>MXleq", "<cmd>Leet tabs<CR>",    desc = "LeetCode: Opens A Picker With All Currently Opened Question Tabs" },
    { "<leader>MXled", "<cmd>Leet desc<CR>",    desc = "LeetCode: Toggle Question desc" },
    { "<leader>MXler", "<cmd>Leet run<CR>",     desc = "LeetCode: Run Currently Opened Question" },
    { "<leader>MXles", "<cmd>Leet submit<CR>",  desc = "LeetCode: Submit Currently Opened Question" },
  },
}
