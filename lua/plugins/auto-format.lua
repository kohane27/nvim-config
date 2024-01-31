return {
  "aidenlangley/auto-format.nvim",
  event = "BufReadPre",
  -- event = { "BufReadPre", "BufNewFile" },
  opts = {
    augroup_name = "AutoFormat",

    -- If formatting takes longer than this amount of time, it will fail. Having no
    -- timeout at all tends to be ugly - larger files, complex or poor formatters
    -- will struggle to format within whatever the default timeout
    -- `vim.lsp.buf.format` uses.
    timeout = 4000,

    -- These filetypes will not be formatted automatically.
    exclude_ft = {},

    -- Prefer formatting via LSP for these filetypes.
    prefer_lsp = {},
    -- synchronously format
    async = false,
  },
  config = function(_, opts)
    require("auto-format").setup(opts)
  end,
}
