local status_ok, leap = pcall(require, "leap")
if not status_ok then
  print("leap failing")
end

-- true to override conflicts
leap.set_default_keymaps(true)

leap.setup({
  case_sensitive = false,
  safe_labels = {}, -- disable auto-jumping to the first match
  max_phase_one_targets = 0, -- first char won't show possible matches
  max_highlighted_traversal_targets = 10,
})

-- vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
-- vim.api.nvim_set_hl(0, "LeapMatch", {
--   fg = "white",
--   bold = true,
--   nocombine = true,
-- })

-- Bidirectional search
local function leap_current_window()
  leap.leap({ target_windows = { vim.fn.win_getid() } })
end
vim.keymap.set("n", "s", leap_current_window, { silent = true })
vim.keymap.set("x", "s", leap_current_window, { silent = true })

-- mark it before jumping
vim.api.nvim_create_autocmd("User", {
  pattern = "LeapEnter",
  callback = function()
    vim.cmd("normal m'")
  end,
})

-- center cursor after jumping
vim.api.nvim_create_autocmd("User", {
  pattern = "LeapLeave",
  callback = function()
    vim.cmd("normal zz")
  end,
})
