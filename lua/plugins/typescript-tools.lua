return {
  "pmizio/typescript-tools.nvim",
  opts = {
    -- disable formatting because using `prettier`
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  },
}
