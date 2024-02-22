-- note-taking/task management
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      { name = "personal", path = "~/vaults/personal" },
      { name = "work", path = "~/vaults/work" },
    },
    config = function(_, opts)
      vim.opt_local.conceallevel = 2
      require("obsidian").setup(opts)
    end,
  },
}

