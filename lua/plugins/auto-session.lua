local status_ok_1, auto_session = pcall(require, "auto-session")
if not status_ok_1 then
  print("auto_session not working")
end

local status_ok_2, session_lens = pcall(require, "session-lens")
if not status_ok_2 then
  print("session-lens not working")
end

auto_session.setup({
  log_level = "error",
  -- cwd_change_handling = {
  --   restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
  --   pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
  --   post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
  --     require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
  --   end,
  -- },
})

session_lens.setup({
  -- path_display = { "shorten" },
  theme_conf = { border = true },
  previewer = true,
})
