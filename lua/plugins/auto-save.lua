local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
  print("auto-save not working")
end

autosave.setup({
  augroup_name = "AutoSavePlug",

  -- events to trigger an auto save
  events = { "InsertLeave", "TextChanged" },

  -- silence the output of `save_fn`
  silent = true,

  -- May define a timeout, or a duration to defer the save for - this allows
  -- for formatters to run, for example if they're configured via an autocmd
  -- that listens for `BufWritePre` event.
  timeout = nil,

  -- Define some filetypes to explicitly not save, in case our existing conditions
  -- don't quite catch all the buffers we'd prefer not to write to.
  exclude_ft = {
    "toggleterm",
    "NvimTree",
    "qf",
    "help",
    "TelescopePrompt",
    "frecency",
    "harpoon",
    "grapple",
    "fzf",
    "portal",
    "nvim-navbuddy",
  },
})
