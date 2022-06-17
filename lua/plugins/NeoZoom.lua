local status_ok, neo_zoom = pcall(require, "neo-zoom")
if not status_ok then
  return
end

neo_zoom.setup({
  left_ratio = 0.0,
  top_ratio = 0.0,
  width_ratio = 1.0,
  height_ratio = 1.0,
  border = "single",

  -- default
  -- left_ratio = 0.2,
  -- top_ratio = 0.03,
  -- width_ratio = 0.67,
  -- height_ratio = 0.9,
  -- border = 'double',
})

local noref_noerr_trunc = { noremap = true, silent = true, nowait = true }
vim.keymap.set("n", "<C-w>m", function()
  vim.cmd("NeoZoomToggle")
end, noref_noerr_trunc)
