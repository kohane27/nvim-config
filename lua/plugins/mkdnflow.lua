return {
  "jakewvincent/mkdnflow.nvim",
  -- TODO: making <leader>ir not working
  enabled = false,
  ft = "markdown",
  event = "VeryLazy",
  -- lazy = false,
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
}
