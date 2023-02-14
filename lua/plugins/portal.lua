local status_ok, portal = pcall(require, "portal")
if not status_ok then
  print("portal not working")
end

portal.setup({
  --- different: jump between buffers
  query = { "different", "different", "different", "different" },

  labels = { "j", "k", "h", "l" },

  --- Keys used for exiting portal selection
  escape = {
    ["<esc>"] = true,
    ["<C-c>"] = true,
  },
})
