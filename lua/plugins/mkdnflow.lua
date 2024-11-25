return {
  "jakewvincent/mkdnflow.nvim",
  ft = "markdown",
  event = "VeryLazy",
  opts = {
    mappings = {
      MkdnTagSpan = false,
      MkdnYankAnchorLink = false,
      MkdnYankFileAnchorLink = false,
      MkdnUpdateNumbering = false,
      MkdnTablePrevRow = false,
      -- used by legendary.nvim
      MkdnTableNewRowBelow = false,
      MkdnTableNewRowAbove = false,
      MkdnTableNewColAfter = false,
      MkdnTableNewColBefore = false,
      MkdnFoldSection = false,
      MkdnUnfoldSection = false,
      MkdnCreateLinkFromClipboard = false,
    },
    to_do = {
      symbols = { " ", "x" },
    },
    -- links = {
    --   implicit_extension = nil,
    --   transform_implicit = true,
    --   transform_explicit = function(text)
    --     text = text:gsub("<", " ")
    --     text = text:gsub(">", " ")
    --     return text
    --   end,
    -- },
  },
}
