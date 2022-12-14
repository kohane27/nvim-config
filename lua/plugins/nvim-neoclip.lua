local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
  print("neoclip not working")
end

neoclip.setup({
  history = 1000,
  enable_persistent_history = true,
  length_limit = 1048576,
  continuous_sync = false,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  default_register = '"',
  default_register_macros = "q",
  enable_macro_history = false,
  content_spec_column = false,
  on_paste = {
    set_reg = false,
  },
  on_replay = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = "<cr>",
        paste = "<c-p>",
        paste_behind = "<c-k>",
        delete = "<c-d>", -- delete an entry
      },
      n = {
        select = "<cr>",
        paste = "p",
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = "P",
        delete = "d",
      },
    },
  },
})
