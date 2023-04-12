local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
  print("auto-save not working")
end

autosave.setup({
  augroup_name = "AutoSavePlug",

  -- events to trigger an auto save
  events = { "InsertLeave" },

  -- silence the output of `save_fn`
  silent = true,

  -- If you'd prefer to write a vim command.
  save_cmd = nil,

  -- What to do after checking if auto save conditions have been met.
  save_fn = function()
    local config = require("auto-save.config")
    if config.save_cmd ~= nil then
      vim.cmd(config.save_cmd)
    elseif config.silent then
      vim.cmd("silent! w")
    else
      vim.cmd("w")
    end
  end,

  -- May define a timeout, or a duration to defer the save for - this allows
  -- for formatters to run, for example if they're configured via an autocmd
  -- that listens for `BufWritePre` event.
  timeout = nil,

  -- Define some filetypes to explicitly not save, in case our existing conditions
  -- don't quite catch all the buffers we'd prefer not to write to.
  exclude_ft = { "toggleterm", "NvimTree", "qf", "help", "TelescopePrompt", "harpoon", "grapple", "fzf", "portal" },
})
