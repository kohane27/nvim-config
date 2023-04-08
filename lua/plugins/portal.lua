local status_ok, portal = pcall(require, "portal")
if not status_ok then
  print("portal not working")
end

portal.setup({
  max_results = 6,

  ---An ordered list of keys for labelling portals.
  ---Labels will be applied in order
  -- labels = { "j", "k", "h", "l", "a", "s", "d", "f" },

  --- Keys for exiting portal selection
  escape = {
    ["<esc>"] = true,
    ["<C-c>"] = true,
  },

  window_options = {
    relative = "cursor",
    width = 80,
    height = 5,
    col = 5,
  },
})
