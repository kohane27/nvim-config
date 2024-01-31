return {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre",
  opts = {
    filesize = 5, -- filesize in MiB
    features = { -- features to disable
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "vimopts",
      "filetype",
    },
  },
  config = function(_, opts)
    require("bigfile").setup(opts)
  end,
}
