return {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre",
  opts = {
    filesize = 2, -- in MiB
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
}
