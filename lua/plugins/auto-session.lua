local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  print("auto_session not working")
end

auto_session.setup({
  auto_save_enabled = true,
  auto_restore_enabled = true,
  -- auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },
  pre_save_cmds = { "NvimTreeClose" },
  -- save_extra_cmds = { "NvimTreeClose" },
  -- post_restore_cmds = { "NvimTreeOpen" },
})
