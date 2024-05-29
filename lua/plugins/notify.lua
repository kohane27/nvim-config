return {
  "rcarriga/nvim-notify",
  enabled = not vim.g.started_by_firenvim,
  config = function()
    local banned_patterns = { "Telescope-Frecency" }
    vim.notify = function(msg, ...)
      for _, pattern in ipairs(banned_patterns) do
        if string.match(msg, pattern) then
          return
        end
      end
      require("notify")(msg, ...)
    end
  end,
}
