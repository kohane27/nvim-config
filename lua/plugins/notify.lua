local status_ok, notify = pcall(require, "notify")
if not status_ok then
  print("notify not working")
end

local banned_messages = {
  "[LSP] Format request failed, no matching language servers.",
  "Telescope-Frecency: removed",
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
