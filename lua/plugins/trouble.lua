local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  print("trouble not working")
end

trouble.setup({
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  action_keys = {
    -- map to {} to remove a mapping
    -- close = {},
    jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
    open_split = { "<c-w>s" }, -- open buffer in new split
    open_vsplit = { "<c-w>v" }, -- open buffer in new vsplit
    open_tab = { "<c-w>t" }, -- open buffer in new tab
    jump_close = { "o" }, -- jump to the diagnostic and close the list
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
    switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
    hover = "K", -- opens a small popup with the full multiline message
    preview = "p", -- preview the diagnostic location
    close_folds = { "zM", "zm" }, -- close all folds
    open_folds = { "zR", "zr" }, -- open all folds
    toggle_fold = { "zA", "za" }, -- toggle fold of current file
  },
  win_config = { border = "rounded" },
})
