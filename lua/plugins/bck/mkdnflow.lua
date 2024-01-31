-- note-taking/task management
-- `mkdnflow` conflicting with `vim-wiki`
-- "vimwiki/vimwiki",
-- "tools-life/taskwiki",

return {
  "jakewvincent/mkdnflow.nvim",
  event = "VeryLazy",
  ft = "markdown",
  opts = {
    links = {
      implicit_extension = nil,
      transform_implicit = true,
      transform_explicit = function(text)
        text = text:gsub("<", " ")
        text = text:gsub(">", " ")
        return text
      end,
    },
    to_do = {
      symbols = { " ", "x" },
    },
  },
  config = function(_, opts)
    require("mkdnflow").setup(opts)
  end,
}
