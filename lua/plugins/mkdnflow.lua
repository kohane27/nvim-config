-- note-taking/task management
-- `mkdnflow` conflicting with `vim-wiki`
-- epwalsh/obsidian.nvim

-- return {
--   "renerocksai/telekasten.nvim",
--   dependencies = { "nvim-telescope/telescope.nvim" },
-- }

return {
  "jakewvincent/mkdnflow.nvim",
  ft = "markdown",
  -- event = "VeryLazy",
  lazy = false,
  opts = {
    -- links = {
    --   implicit_extension = nil,
    --   transform_implicit = true,
    --   transform_explicit = function(text)
    --     text = text:gsub("<", " ")
    --     text = text:gsub(">", " ")
    --     return text
    --   end,
    -- },
    to_do = {
      symbols = { " ", "x" },
    },
  },
  config = function(_, opts)
    require("mkdnflow").setup(opts)
  end,
}
