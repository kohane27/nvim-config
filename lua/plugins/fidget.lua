local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  return
end

fidget.setup({
  window = {
    relative = "win", -- where to anchor, either "win" or "editor"
    blend = 0, -- &winblend for the window
    zindex = nil, -- the zindex value for the window
  },
})
