local status_ok, leap = pcall(require, "leap")
if not status_ok then
  print("leap failing")
end

-- true to override conflicts
leap.set_default_keymaps(true)

leap.setup({
  case_insensitive = true,
  -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- and forces auto-jump to be on or off.
  -- safe_labels = { . . . },
  -- labels = { . . . },
  -- These keys are captured directly by the plugin at runtime.
  special_keys = {
    repeat_search = "<enter>",
    next_match = "<enter>",
    prev_match = "<tab>",
    next_group = "<space>",
    prev_group = "<tab>",
    eol = "<space>",
  },
})

-- Bidirectional search
function leap_bidirectional()
  require("leap").leap({ ["target-windows"] = { vim.api.nvim_get_current_win() } })
end

-- Map them to your preferred key, like:
vim.keymap.set("n", "s", leap_bidirectional, { silent = true })

vim.cmd([[
" use clever-f
silent! unmap f
silent! unmap F
silent! unmap t
silent! unmap T
]])

-- vim.cmd([[
-- autocmd ColorScheme * lua require('leap').init_highlight(true)
-- ]])
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "LeapMatch", { ctermfg = "#99ddff" })
--     vim.api.nvim_set_hl(0, "LeapLabelPrimary", { ctermfg = "#99ddff" })
--     vim.api.nvim_set_hl(0, "LeapLabelSecondary", { ctermfg = "#99ddff" })
--   end,
-- })

--
-- {val}    Highlight definition map, like |synIDattr()|. In
--          addition, the following keys are recognized:
--          • default: Don't override existing definition
--            |:hi-default|
--          • ctermfg: Sets foreground of cterm color
--            |highlight-ctermfg|
--          • ctermbg: Sets background of cterm color
--            |highlight-ctermbg|
--          • cterm: cterm attribute map, like
--            |highlight-args|. Note: Attributes default to
--            those set for `gui` if not set.
