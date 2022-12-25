local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
  print("neoclip not working")
end

neoclip.setup({
  history = 1000,
  enable_persistent_history = true,
  default_register = '"',
  enable_macro_history = false,
  on_paste = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = nil,
        paste = "<cr>",
        delete = nil, -- delete an entry
      },
      n = {
        select = nil,
        paste = "<cr>",
        --- It's possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = "P",
        delete = "d",
      },
    },
  },
})
