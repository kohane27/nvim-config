local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

auto_session.setup({
  log_level = "error", -- info, error, debug
  auto_session_suppress_dirs = { "~/", "~/Projects" },
  auto_session_enable_last_session = false,
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
})

require("session-lens").setup({
  -- path_display = { "shorten" },
  theme_conf = { border = true },
  previewer = true,
})
