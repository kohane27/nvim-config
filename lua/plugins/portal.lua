local status_ok, portal = pcall(require, "portal")
if not status_ok then
  return
end

portal.setup({})

-- vim.keymap.set("n", "<C-o>", require("portal").jump_backward, {})
-- vim.keymap.set("n", "<C-i>", require("portal").jump_forward, {})
