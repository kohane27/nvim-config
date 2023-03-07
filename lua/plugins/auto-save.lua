local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
  print("auto-save not working")
end

autosave.setup({
  enabled = true,
  execution_message = { message = "" },
  print_enabled = false,
  trigger_events = { "InsertLeave" },
  -- trigger_events = { "InsertLeave", "TextChanged" },
  -- determines whether to save the current buffer or not
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")
    if
      fn.getbufvar(buf, "&modifiable") == 1
      and utils.not_in(fn.getbufvar(buf, "&filetype"), { "c" })
      -- and utils.not_in(fn.expand("%:t"), {
      --   -- TODO: not working
      --   "daily.md",
      --   "weekly.md",
      --   "monthly.md",
      --   "quarterly.md",
      --   "yearly.md",
      -- })
    then
      return true -- met condition(s), can save
    end
    return false -- can't save
  end,
  write_all_buffers = true, -- write all buffers when the current one meets `condition`
  debounce_delay = 200, -- saves the file at most every `debounce_delay` milliseconds
  callbacks = { -- functions to be executed at different intervals
    enabling = nil, -- ran when enabling auto-save
    disabling = nil, -- ran when disabling auto-save
    before_asserting_save = nil, -- ran before checking `condition`
    before_saving = nil, -- ran before doing the actual save
    -- before_saving = function()
    --   return vim.lsp.buf.format()
    -- end,
    after_saving = nil, -- ran after doing the actual save
  },
})
