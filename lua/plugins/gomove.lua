local status_ok, gomove = pcall(require, "gomove")
if not status_ok then
  return
end

gomove.setup({
  map_defaults = false,
  reindent = true, -- reindent lines moved vertically
  undojoin = true, -- undojoin same direction moves
  move_past_end_col = false, -- move past end column when moving blocks horizontally
})
