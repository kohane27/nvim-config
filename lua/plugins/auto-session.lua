return {
  -- TODO: `SessionDelete`: not working; need to disable autosave after auto-session `SessionDelete`?
  -- TODO: check out other session plugins
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    auto_save_enabled = true,
    auto_restore_enabled = true,
    -- auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },
    pre_save_cmds = { "NvimTreeClose" },
    -- save_extra_cmds = { "NvimTreeClose" },
    -- post_restore_cmds = { "NvimTreeOpen" },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)
  end,
}
