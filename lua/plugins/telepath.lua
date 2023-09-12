local status_ok, telepath = pcall(require, "telepath")
if not status_ok then
  print("auto-format not working")
end

telepath.use_default_mappings({ keys = { "r" } })
