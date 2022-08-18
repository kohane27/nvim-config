local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
  return
end

autosave.setup({
  enabled = true,
  execution_message = {
    message = function() -- message to print on save
      return ""
    end,
    dim = 0.18, -- dim the color of `message`
    cleaning_interval = 1250, -- (milliseconds) clean MsgArea after displaying `message`
  },

  -- trigger_events = { "InsertLeave" },
  -- making react project error prone
  -- trigger_events = { "InsertLeave", "TextChanged" },
  trigger_events = { "InsertLeave", "TextChanged" },
  -- determines whether to save the current buffer or not
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")
    if
      fn.getbufvar(buf, "&modifiable") == 1
      and utils.not_in(fn.getbufvar(buf, "&filetype"), {
        "lua",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "tsx",
        "jsx",
        "svelte",
        "vue",
      })
      -- and utils.not_in(fn.bufname(), {
      --   "packer_init.lua",
      --   "auto-save.lua",
      -- })
    then
      return true -- met condition(s), can save
    end
    return false -- can't save
  end,
  write_all_buffers = false, -- write all buffers when the current one meets `condition`
  debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
})
