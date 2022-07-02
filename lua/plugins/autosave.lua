local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
  return
end

autosave.setup({
  enabled = true,
  execution_message = "",
  -- events = { "InsertLeave" },
  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filename_is_not = { "packer_init.lua" },
    -- filetype_is_not = { "lua" },
    filetype_is_not = {
      "lua",
      -- "javascript",
      -- "typescript",
      "javascriptreact",
      "typescriptreact",
      "tsx",
      "jsx",
      "svelte",
      "vue",
    },
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = false,
  clean_command_line_interval = 0,
  debounce_delay = 170,
})

-- autosave.hook_before_saving = function ()
--     if vim.bo.filetype ~= "rust" then
--         vim.g.auto_save_abort = true -- abort saving non rust files/ only save rust files
--     end
-- end
