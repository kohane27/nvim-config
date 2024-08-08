return {
  lazy = false,
  "JoosepAlviste/nvim-ts-context-commentstring",
  opts = {
    enable_autocmd = false,
  },
  config = function()
    vim.g.skip_ts_context_commentstring_module = true
  end,
}
