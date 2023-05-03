local status_ok_1, auto_session = pcall(require, "auto-session")
if not status_ok_1 then
  print("auto_session not working")
end

local status_ok_2, session_lens = pcall(require, "session-lens")
if not status_ok_2 then
  print("session-lens not working")
end

-- https://github.com/rmagatti/auto-session#recommended-sessionoptions-config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

auto_session.setup({
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },
  -- load the last loaded session if session for cwd does not exist
  auto_session_enable_last_session = false,
})

session_lens.setup({
  -- path_display = { "shorten" },
  theme_conf = { border = true },
  previewer = true,
})
