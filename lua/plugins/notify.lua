return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({})
    local banned_messages = {
      "[LSP] Format request failed, no matching language servers.",
      "Telescope-Frecency: removed %d missing entries.",
      "No information available",
    }

    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      require("notify")(msg, ...)
    end
  end,
}
