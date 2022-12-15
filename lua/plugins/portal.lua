local status_ok, portal = pcall(require, "portal")
if not status_ok then
  print("portal not working")
end

portal.setup({
  query = { "modified", "different", "valid" },

  labels = { "j", "k", "h", "l" },

  portal = {
    title = {
      --- When a portal is empty, render an default portal title
      render_empty = true,

      --- The raw window options used for the portal title window
      options = {
        relative = "cursor",
        width = 80,
        height = 1,
        col = 2,
        style = "minimal",
        focusable = false,
        border = "single",
        noautocmd = true,
        zindex = 98,
      },
    },

    body = {
      -- When a portal is empty, render an empty buffer body
      render_empty = true,

      --- The raw window options used for the portal body window
      options = {
        relative = "cursor",
        width = 80,
        height = 3,
        col = 2,
        focusable = false,
        border = "single",
        noautocmd = true,
        zindex = 99,
      },
    },
  },
})
