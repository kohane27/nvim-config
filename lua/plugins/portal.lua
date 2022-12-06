local status_ok, portal = pcall(require, "portal")
if not status_ok then
  return
end

portal.setup({})
