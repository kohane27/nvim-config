local status_ok, neo_zoom = pcall(require, "neo-zoom")
if not status_ok then
  return
end

local noref_noerr_trunc = { noremap = true, silent = true, nowait = true }
neo_zoom.setup({
  -- use the defaults or change any one to overwrite
  left_ratio = 0,
  top_ratio = 0,
  width_ratio = 0.9,
  height_ratio = 0.9,
  border = "double",
})

vim.keymap.set("n", "<C-w>m", function()
  vim.cmd("NeoZoomToggle")
end, noref_noerr_trunc)
