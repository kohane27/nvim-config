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
    filetype_is_not = {},
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = false,
  clean_command_line_interval = 0,
  debounce_delay = 170,
})
