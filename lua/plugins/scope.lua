local status_ok, scope = pcall(require, "scope")
if not status_ok then
  print("scope failing")
end

scope.setup()
