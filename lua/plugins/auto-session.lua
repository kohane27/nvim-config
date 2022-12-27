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
  log_level = "error",
  auto_save_enabled = true, -- nil by default
  auto_restore_enabled = true, -- nil by default
  auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },
  post_cwd_changed_hook = function()
    require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
  end,
})

session_lens.setup({
  -- path_display = { "shorten" },
  theme_conf = { border = true },
  previewer = true,
})
